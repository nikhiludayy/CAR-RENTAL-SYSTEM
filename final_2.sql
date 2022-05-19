drop database if exists car_rental;
create database car_rental;
use car_rental;
create table SERVICE_PROVIDER(
GSTIN varchar(25) primary key ,
Company_Name varchar(20),
ratings float(5)

);

insert into SERVICE_PROVIDER values("29GSLG1314R9Z6", "Shammi Services",4);
insert into SERVICE_PROVIDER values("7BNWLG5214R9B2", "Khanna car Services",3.9 );

insert into SERVICE_PROVIDER values("3KLASLX4567F3", "Deep Car Services",4.3);
insert into SERVICE_PROVIDER values("8BBPLSLW9637R8", "Gaitonde Services",4);

insert into SERVICE_PROVIDER values("6ASDFSLV3697H8", "Shinde CarServices",3.9);

create table stloc(
Sno int,
state varchar(30),
primary key(sno));
insert into stloc values(1,"Punjab");
insert into stloc values(2,"Haryana");
insert into stloc values(3,"Rajasthan");
insert into stloc values(4,"Maharashtra");
insert into stloc values(5,"Uttar Pradesh");

create table states(
SNO int,
GSTIN varchar(25) ,
state int,
primary key(SNO),
foreign key(state) references stloc(Sno),
foreign key (GSTIN) references SERVICE_PROVIDER(GSTIN) ON DELETE cascade);

INSERT INTO states values( 1,"29GSLG1314R9Z6", 1);
INSERT INTO states values( 2,"29GSLG1314R9Z6", 2);
INSERT INTO states values( 3,"29GSLG1314R9Z6", 4);  

INSERT INTO states values( 4,"7BNWLG5214R9B2", 3);
INSERT INTO states values( 5,"7BNWLG5214R9B2", 2);
INSERT INTO states values( 6,"7BNWLG5214R9B2", 4);

INSERT INTO states values( 7,"3KLASLX4567F3",  4);
INSERT INTO states values( 8,"3KLASLX4567F3",  5);
INSERT INTO states values( 9,"3KLASLX4567F3",  3);

INSERT INTO states values(10,"8BBPLSLW9637R8", 5);
INSERT INTO states values(11,"8BBPLSLW9637R8", 1);
INSERT INTO states values(12,"8BBPLSLW9637R8", 2);

INSERT INTO states values(13,"6ASDFSLV3697H8", 5);
INSERT INTO states values(14,"6ASDFSLV3697H8", 3);
INSERT INTO states values(15,"6ASDFSLV3697H8", 1);




create table locations(
STATE int,
foreign key (STATE) references stloc(sno),
CITY varchar(15),
primary key(city)
);

insert into locations values(1, "Amritsar");
insert into locations values(1, "Bathinda");
insert into locations values(1, "Ludhiana");
insert into locations values(1, "Patiala");
insert into locations values(1, "Sangrur");

insert into locations values(2, "Faridabad");
insert into locations values(2, "Panipat");
insert into locations values(2, "Hisar");
insert into locations values(2, "Sonipat");
insert into locations values(2, "Ambala");

insert into locations values(3, "Jaipur");
insert into locations values(3, "Udaipur");
insert into locations values(3, "Jodhpur");
insert into locations values(3, "Bikaner");
insert into locations values(3, "Ajmer");

insert into locations values(5, "Lucknow");
insert into locations values(5, "Agra");
insert into locations values(5, "Aligarh");
insert into locations values(5, "Varanasi");
insert into locations values(5, "Ayodhya");

insert into locations values(4, "Mumbai");
insert into locations values(4, "Pune");
insert into locations values(4, "Nagpur");
insert into locations values(4, "Nashik");
insert into locations values(4, "Panvel");


CREATE TABLE CAR_TYPES(

TYPE_ID int PRIMARY KEY,
TYPE_NAME VARCHAR(25)

);


INSERT INTO CAR_TYPES VALUES ( 1, 'Hatchback');
INSERT INTO CAR_TYPES VALUES ( 2, 'Mini');
INSERT INTO CAR_TYPES VALUES ( 3, 'Sedan');
INSERT INTO CAR_TYPES VALUES ( 4, 'SUV');


CREATE TABLE CAR_DETAILS(
REG_NO Varchar(100) PRIMARY KEY,
MANUFACTURER_NAME_MDL VARCHAR(100),
COMPANY_NAME varchar(100),
foreign key(company_name)  REFERENCES  SERVICE_PROVIDER(gstin) ON DELETE CASCADE,
CAR_TYPE int,
foreign key(car_type) REFERENCES CAR_TYPES(TYPE_ID),
COST INT,
CURRENT_STATUS VARCHAR(30) CHECK (CURRENT_STATUS IN('BKD','UNBKD'))  DEFAULT 'UNBKD'
);

insert into CAR_DETAILS 
VALUES("PB14JD0932","MARUTI SUZUKI","29GSLG1314R9Z6",1,2975,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH23JD0452","HONDA","29GSLG1314R9Z6",3,4350,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL02HF0923","FORD","29GSLG1314R9Z6",4,6210,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR11HF2344","HUNDAYI","29GSLG1314R9Z6",2,2290,"UNBKD");

insert into CAR_DETAILS 
VALUES("MH14JD0932","MARUTI SUZUKI","29GSLG1314R9Z6",3,4590,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB23JD0452","HONDA","29GSLG1314R9Z6",1,3170,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH11EF6473","FORD","29GSLG1314R9Z6",2,2780,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR01FK3232","HUNDAYI","29GSLG1314R9Z6",4,6250,"UNBKD");

insert into CAR_DETAILS 
VALUES("HR10JD0932","MARUTI SUZUKI","29GSLG1314R9Z6",2,2350,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL23JD0452","HONDA","29GSLG1314R9Z6",4,6150,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH02HF0923","FORD","29GSLG1314R9Z6",3,2890,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB11HF2344","HUNDAYI","29GSLG1314R9Z6",1,2950,"UNBKD");

insert into CAR_DETAILS 
VALUES("DL04FH3242","MARUTI SUZUKI","29GSLG1314R9Z6",4,5875,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR23JD0452","HONDA","29GSLG1314R9Z6",2,2750,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL02HX0923","FORD","29GSLG1314R9Z6",1,3190,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH11HF2344","HUNDAYI","29GSLG1314R9Z6",3,4890,"UNBKD");


insert into CAR_DETAILS 
VALUES("MH21FN8429","MARUTI SUZUKI","7BNWLG5214R9B2",1,2850,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR01HF0823","HONDA","7BNWLG5214R9B2",3,4210,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL12JA7532","FORD","7BNWLG5214R9B2",4,6100,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ14JD0932","HUNDAYI","7BNWLG5214R9B2",2,3090,"UNBKD");

insert into CAR_DETAILS 
VALUES("HR21FN8429","MARUTI SUZUKI","7BNWLG5214R9B2",2,2400,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH01HF0823","HONDA","7BNWLG5214R9B2",4,6950,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ12JA7532","FORD","7BNWLG5214R9B2",3,4050,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL14JD0932","HUNDAYI","7BNWLG5214R9B2",1,3290,"UNBKD");

insert into CAR_DETAILS 
VALUES("RJ21FN8429","MARUTI SUZUKI","7BNWLG5214R9B2",3,3800,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL01HF0823","HONDA","7BNWLG5214R9B2",1,3190,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH12JA7532","FORD","7BNWLG5214R9B2",2,2700,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR14JD0932","HUNDAYI","7BNWLG5214R9B2",4,5920,"UNBKD");

insert into CAR_DETAILS 
VALUES("RJ02RI8429","MARUTI SUZUKI","7BNWLG5214R9B2",4,5990,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL03OF0823","HONDA","7BNWLG5214R9B2",2,3190,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH15JF7532","FORD","7BNWLG5214R9B2",1,3590,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR03OY0932","HUNDAYI","7BNWLG5214R9B2",3,3990,"UNBKD");




insert into CAR_DETAILS 
VALUES("MH10HF7432","MARUTI SUZUKI","3KLASLX4567F3",1,3250,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL03NK3492","HONDA","3KLASLX4567F3",3,4275,"UNBKD");
insert into CAR_DETAILS 
VALUES("UP04YW7324","FORD","3KLASLX4567F3",4,5790,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ13HF9342","HUNDAYI","3KLASLX4567F3",2,2260,"UNBKD");

insert into CAR_DETAILS 
VALUES("RJ10HF7432","MARUTI SUZUKI","3KLASLX4567F3",3,4190,"UNBKD");
insert into CAR_DETAILS 
VALUES("UP03NK3492","HONDA","3KLASLX4567F3",1,3280,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL04YW7324","FORD","3KLASLX4567F3",2,2730,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH13HF9342","HUNDAYI","3KLASLX4567F3",4,6260,"UNBKD");

insert into CAR_DETAILS 
VALUES("DL10HF7432","MARUTI SUZUKI","3KLASLX4567F3",2,2580,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH03NK3492","HONDA","3KLASLX4567F3",4,6790,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ04YW7324","FORD","3KLASLX4567F3",3,4190,"UNBKD");
insert into CAR_DETAILS 
VALUES("UP13HF9342","HUNDAYI","3KLASLX4567F3",1,3350,"UNBKD");

insert into CAR_DETAILS 
VALUES("UP10HF7432","MARUTI SUZUKI","3KLASLX4567F3",4,5650,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ03NK3492","HONDA","3KLASLX4567F3",2,2610,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH04YW7324","FORD","3KLASLX4567F3",1,3350,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL13HF9342","HUNDAYI","3KLASLX4567F3",3,4100,"UNBKD");


insert into CAR_DETAILS 
VALUES("MH02KD2348","MARUTI SUZUKI","8BBPLSLW9637R8",1,3490,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR03SD3422","HONDA","8BBPLSLW9637R8",3,4290,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB11RE2345","FORD","8BBPLSLW9637R8",4,6300,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL01ER2342","HUNDAYI","8BBPLSLW9637R8",2,2800,"UNBKD");

insert into CAR_DETAILS 
VALUES("DL02KD2348","MARUTI SUZUKI","8BBPLSLW9637R8",3,2750,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB03SD3422","HONDA","8BBPLSLW9637R8",1,3450,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR11RE2345","FORD","8BBPLSLW9637R8",2,2490,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH01ER2342","HUNDAYI","8BBPLSLW9637R8",4,6890,"UNBKD");

insert into CAR_DETAILS 
VALUES("HR02KD2348","MARUTI SUZUKI","8BBPLSLW9637R8",2,2600,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH03SD3422","HONDA","8BBPLSLW9637R8",4,6570,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL11RE2345","FORD","8BBPLSLW9637R8",3,3980,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB01ER2342","HUNDAYI","8BBPLSLW9637R8",1,3290,"UNBKD");

insert into CAR_DETAILS 
VALUES("PB02KD2348","MARUTI SUZUKI","8BBPLSLW9637R8",4,5960,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL03SD3422","HONDA","8BBPLSLW9637R8",2,2650,"UNBKD");
insert into CAR_DETAILS 
VALUES("MH11RE2345","FORD","8BBPLSLW9637R8",1,3390,"UNBKD");
insert into CAR_DETAILS 
VALUES("HR01ER2342","HUNDAYI","8BBPLSLW9637R8",3,4100,"UNBKD");



insert into CAR_DETAILS 
VALUES("DL13FU3420","MARUTI SUZUKI","6ASDFSLV3697H8",1,2800,"UNBKD");
insert into CAR_DETAILS 
VALUES("UP22FN3914","HONDA","6ASDFSLV3697H8",3,4120,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB08FR5643","FORD","6ASDFSLV3697H8",4,6200,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ34JD3489","HUNDAYI","6ASDFSLV3697H8",2,2750,"UNBKD");

insert into CAR_DETAILS 
VALUES("RJ13FU3420","MARUTI SUZUKI","6ASDFSLV3697H8",3,4390,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB22FN3914","HONDA","6ASDFSLV3697H8",1,3250,"UNBKD");
insert into CAR_DETAILS 
VALUES("UP08FR5643","FORD","6ASDFSLV3697H8",2,2675,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL34JD3489","HUNDAYI","6ASDFSLV3697H8",4,6010,"UNBKD");

insert into CAR_DETAILS 
VALUES("UP13FU3420","MARUTI SUZUKI","6ASDFSLV3697H8",2,2550,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL22FN3914","HONDA","6ASDFSLV3697H8",4,5950,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ08FR5643","FORD","6ASDFSLV3697H8",3,4280,"UNBKD");
insert into CAR_DETAILS 
VALUES("PB34JD3489","HUNDAYI","6ASDFSLV3697H8",1,2570,"UNBKD");

insert into CAR_DETAILS 
VALUES("PB13FU3420","MARUTI SUZUKI","6ASDFSLV3697H8",4,5710,"UNBKD");
insert into CAR_DETAILS 
VALUES("RJ22FN3914","HONDA","6ASDFSLV3697H8",2,2790,"UNBKD");
insert into CAR_DETAILS 
VALUES("DL08FR5643","FORD","6ASDFSLV3697H8",1,3450,"UNBKD");
insert into CAR_DETAILS 
VALUES("UP34JD3489","HUNDAYI","6ASDFSLV3697H8",3,3990,"UNBKD");




CREATE TABLE Drivers( 
D_ID int PRIMARY KEY,
D_Name varchar(100),
DOB DATE  NOT NULL,
RATING int,
Company_Name varchar(100),
FOREIGN KEY(Company_Name) REFERENCES SERVICE_PROVIDER(gstin) ON DELETE CASCADE
);



INSERT INTO Drivers Values (567, 'Amit', '1992-12-06', 4, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (568, 'Arjun', '1973-12-7', 4.9, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (569, 'Bhuvan', '1992-11-9', 4.5, '6ASDFSLV3697H8');
INSERT INTO Drivers Values (570, 'Salman', '1982-12-10', 3.8, '8BBPLSLW9637R8');
INSERT INTO Drivers Values (571, 'Tejinder', '1978-01-01', 3.1, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (572, 'Laxman', '1969-06-02', 3.4, '8BBPLSLW9637R8');
INSERT INTO Drivers Values (573, 'William', '1986-1-08', 4.2, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (574, 'Bhairav', '1997-12-12', 4.6, '8BBPLSLW9637R8');
INSERT INTO Drivers Values (575, 'Madhav', '1965-02-07', 4.5, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (576, 'Aviral', '1964-02-17', 4.3, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (577, 'Avii', '1976-12-06', 5, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (578, 'Ambar', '1987-03-03', 0.9, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (579, 'Chakshu', '1986-06-06', 2.9, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (580, 'Chandan', '1992-01-09', 3, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (654, 'Ramu', '1964-10-09', 5, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (655, 'Raj', '1983-03-03', 4.1, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (657, 'Sanju', '1992-12-06', 4.2, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (217, 'Saksham', '1995-12-11', 4.4, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (437, 'Amrinder', '1993-02-12', 4, '6ASDFSLV3697H8');
INSERT INTO Drivers Values (861, 'Ashok', '1968-12-21', 3.9, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (430, 'Amit', '1972-05-04', 3.7, '8BBPLSLW9637R8');
INSERT INTO Drivers Values (420, 'Ajit', '1985-07-05', 1.8, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (098, 'Sukhchain', '1997-12-18', 5, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (762, 'Yash', '1962-12-10', 2.5, '29GSLG1314R9Z6');
INSERT INTO Drivers Values (763, 'Varun', '1992-03-06', 3.8, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (764, 'Raju', '1982-01-03', 4.9, '6ASDFSLV3697H8');
INSERT INTO Drivers Values (765, 'Ganesh', '1993-01-07', 3, '7BNWLG5214R9B2');
INSERT INTO Drivers Values (766, 'Purushottam', '1987-03-06', 2, '8BBPLSLW9637R8');
INSERT INTO Drivers Values (767, 'Danish', '1992-12-06', 4, '3KLASLX4567F3');
INSERT INTO Drivers Values (769, 'Manish', '1998-12-07', 3.5, '3KLASLX4567F3');

create table Booked_car(
reg_no varchar(100),
foreign key(reg_no) references car_details(reg_no),
booked_from date,
booked_to date);

insert into booked_car 
values("PB34JD3489","2022-03-21","2022-03-12");

show tables;
desc car_details;
desc car_types;
desc drivers;
desc locations;
desc service_provider;
desc states;

