create database QL_THUVIEN
go

use QL_THUVIEN
go

create table TACGIA (
	MATG char(6) not null,
	TENTG nvarchar(50) not null,
	DIACHI nvarchar(50),
	constraint PK_TACGIA primary key (MATG)
)

create table LOAISACH (
	MALOAI char(3) not null,
	TENLOAI nvarchar(20) not null,
	constraint PK_LOAISACH primary key (MALOAI)
)

create table NHAXUATBAN (
	MANXB char(6) not null,
	TENNXB nvarchar(50) not null,
	DCNXB nvarchar(50),
	DTNXB nvarchar(16),
	constraint PK_NHAXUATBAN primary key (MANXB)
)

create table SACH (
	MASH char(6) not null,
	TENSH nvarchar(50) not null,
	MATG char(6) not null,
	MANXB char(6) not null,
	NAMXB int,
	MALOAI char(3),
	constraint PK_SACH primary key (MASH)
)

create table DOCGIA (
	MADG char(6) not null,
	TENDG nvarchar(50) not null,
	NGAYSINH date,
	GIOITINH nvarchar(10),
	LIENHE char(16),
	constraint PK_DOCGIA primary key (MADG)
)

create table MUONTRASACH (
	MADG char(6) not null,
	MASH char(6) not null,
	NGAYMUON date not null,
	NGAYTRA date,
	constraint PK_MUONTRASACH primary key (MADG, MASH)
)

alter table SACH
	add constraint FK_SACH_NHAXUATBAN foreign key (MANXB) references NHAXUATBAN(MANXB)
alter table SACH
	add constraint FK_SACH_TACGIA foreign key (MATG) references TACGIA(MATG)
alter table SACH
	add constraint FK_SACH_LOAISACH foreign key (MALOAI) references LOAISACH(MALOAI)
alter table MUONTRASACH
	add constraint FK_MUONTRASACH_DOCGIA foreign key (MADG) references DOCGIA(MADG)
alter table MUONTRASACH
	add constraint FK_MUONTRASACH_SACH foreign key (MASH) references SACH(MASH)


insert into TACGIA(MATG, TENTG, DIACHI) values
('TG001', N'Nguyễn Hữu Anh', N'Q3, TP.HCM'),
('TG002', N'Tô Hoài', N'Bình Thạnh, TP.HCM'),
('TG003', N'Nguyễn Quang Sang', N'Trảng Bàng, Tây Ninh'),
('TG004', N'Hồ Tùng Mậu', N'Trảng Bom, Đồng Nai'),
('TG005', N'Thi Anh Trung', N'Bến Lức, Long An'),
('TG006', N'Nguyễn Nhật Ánh', N'Q1, TP. HCM')

insert into LOAISACH(MALOAI, TENLOAI) values
('SH', N'SÁCH'),
('TR', N'TRUYỆN'),
('TC', N'TẠP CHÍ')

insert into NHAXUATBAN(MANXB, TENNXB, DCNXB, DTNXB) values
('NXB01', N'Đại học quốc gia TP. HCM', N'Quận 1, TP. HCM', '08.765348758'),
('NXB02', N'Đại học quốc gia Hà Nội', N'Quận Cầu Giấy, Hà Nội', '02.16342363'),
('NXB03', N'Thanh Niên', N'Quận 3, TP. HCM', '04.153517776'),
('NXB04', N'Tổng Hợp', N'Quận 1, TP. HCM', '07.162341753'),
('NXB05', N'Nhi Đồng', N'Quận 1, TP. HCM', '04.753646738')

insert into SACH(MASH, TENSH, MATG, NAMXB, MANXB, MALOAI) values
('SH001', N'Toán rời rạc', 'TG001', 1998, 'NXB01', 'SH'),
('TR001', N'Dế mèn phiêu lưu ký', 'TG002', 1997, 'NXB05', 'TR'),
('TR002', N'Bàn có 5 chỗ ngồi', 'TG006', 2000, 'NXB05', 'TR'),
('TC001', N'Tạp chí Tin học và Điều khiển số 6/2015', 'TG003', 2015, 'NXB04', 'TC'),
('TC002', N'Tạp chí Tin học và Điều khiển số 9/2015', 'TG003', 2015, 'NXB04', 'TC'),
('SH002', N'Kỹ thuật lập trình C#', 'TG004', 1998, 'NXB04', 'SH')

insert into DOCGIA(MADG, TENDG, NGAYSINH, GIOITINH, LIENHE) values
('DG001', N'Nguyễn Thanh Nam', '1990-09-13', N'Nam', '012351234124'),
('DG002', N'Lê Văn Anh', '1994-04-24', N'Nam', '0437562232'),
('DG003', N'Trần Thanh Bình', '1989-10-30', N'Nữ', '0512512564'),
('DG004', N'Nguyễn Thị Thanh', '1997-02-02', N'Nữ', '0131245124')

insert into MUONTRASACH(MADG, MASH, NGAYMUON, NGAYTRA) values
('DG004', 'SH002', '2016-05-21', '2016-05-28'),
('DG001', 'SH001', '2016-06-01', '2016-06-02'),
('DG003', 'SH001', '2016-06-01', '2016-06-11'),
('DG001', 'SH002', '2016-06-01', null)