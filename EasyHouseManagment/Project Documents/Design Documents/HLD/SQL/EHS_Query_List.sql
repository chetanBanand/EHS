use Sep19CHN

create schema EHMSPLP

--create table EHMSPLP.Users
--(
--UserName varchar(25) primary key,
--UserPassword varchar(25) not null ,
--UserType varchar(10) not null,

--)

select * from EHSPLP.Users
-------------------------------------------------------------------------

create table EHMSPLP.UserProfile
(
UserId int identity primary key, 
UserName varchar(25) not null UNIQUE, 
UserPassword varchar(25) not null ,
FirstName varchar(25) not null, 
LastName varchar(25), 
DateofBirth date not null, 
PhoneNo varchar(10) not null, 
Address varchar(250) not null, 
StateId int,  
CityId int,  
EmailId varchar(50) not null,
Foreign key(StateId) references  EHMSPLP.State(StateId),
Foreign key(CityId) references  EHMSPLP.City(CityId),

)

insert into EHMSPLP.UserProfile values('User1','12345','First','Last','01/01/1990','1234567890','Sipcot',1,1,'Test@gmail.com')
--------------------------------------------------------------------------------------

create table EHMSPLP.State
(
StateId int identity(1,1) primary key, 
StateName varchar(30)
)

insert EHMSPLP.State values('Tamilnadu')
insert EHMSPLP.State values('Andhrapradesh')
insert EHMSPLP.State values('Karnataka')
DROP TABLE EHMSPLP.State
------------------------------------

create table EHMSPLP.City
(

CityId int identity(1,1) primary key, 
CityName varchar(50) not null, 
StateId int not null,
Foreign key(StateId) references  EHMSPLP.State(StateId)
)

insert EHMSPLP.City values('chennai',1)
insert EHMSPLP.City values('Vizag',2)
insert EHMSPLP.City values('Bangalore',3)

select * from EHMSPLP.City
DROP TABLE EHMSPLP.City

---------------------------------------------

create table EHMSPLP.Property
 (
 PropertyId int identity(1,1) primary key,
 PropertyName varchar(50) not null, 
 PropertyType varchar(15) not null, 
 PropertyOption bit not null, 
 IsVerified bit not null,
 IsActive bit not null,
 Description varchar(250),
 Address varchar(250) not null, 
 PriceRange money not null, 
 InitialDeposit money not null, 
 Landmark varchar(25) not null,
 UserId int,
 Foreign key(UserId) references  EHMSPLP.UserProfile(UserId)
)

select * from EHMSPLP.Property

-------------------------------------------------------------

Create table EHMSPLP.Images
(
ImageId int identity(1,1) Primary key,
PropertyId int ,
 PropertyImage Image not null
 Foreign key(PropertyId) references  EHMSPLP.Property(PropertyId)
)



Create table EHMSPLP.Cart
(
CartId int identity(1,1) Primary key,
UserId int ,
 PropertyId int,
  Foreign key(PropertyId) references  EHMSPLP.Property(PropertyId),
  Foreign key(UserId) references EHMSPLP.UserProfile(UserId)
)


insert into EHMSPLP.Cart values (1,1)