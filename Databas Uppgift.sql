drop database albindatabase;
create database AlbinDataBase;
use AlbinDataBase;

create table Spelare(
	PersonNr char(13),
    Namn varchar(20),
    Ålder int,
    primary key(PersonNr)
    )engine=innodb;
    
create table Tävling(
	Tävlingsnamn varchar(20),
    Datum date,
    primary key(Tävlingsnamn)
    )engine=innodb;
    
create table Regn(
	Typ varchar(20),
    Vindstyrka int,
    primary key(Typ)	
)engine=innodb;

create table Konstruktion(
	SerialNr int,
    Hårdhet int,
    primary key(SerialNr)	
)engine=innodb;

create table Jacka(
	Storlek varchar(5),
    Material varchar(10),
    Modell varchar(10),
    PersonNr char(13),
    primary key(PersonNr,Modell),
    foreign key(PersonNr) references Spelare(PersonNr)
)engine=innodb;

create table Klubba(
	Nr int,
    Material varchar(10),
    PersonNr char(13),
    SerialNr int,
    primary key(PersonNr,Nr),
    foreign key(PersonNr) references Spelare(PersonNr),
    foreign key(SerialNr) references Konstruktion(SerialNr)
)engine=innodb;

create table Delta(
	PersonNr char(13),
	Tävlingsnamn varchar(20),
    foreign key(PersonNr) references Spelare(PersonNr),
    foreign key(Tävlingsnamn) references Tävling(Tävlingsnamn)
)engine=innodb;

create table Har(
	Typ varchar(20),
	Tävlingsnamn varchar(20),
    tidpunkt time,
    foreign key(Typ) references Regn(Typ),
    foreign key(Tävlingsnamn) references Tävling(Tävlingsnamn)
)engine=innodb;

    
insert into Spelare (PersonNr,namn,ålder) values (199602091234,"Johan Andersson", 25);
insert into Spelare (PersonNr,namn,ålder) values (197002024321,"Annika Persson",51);
insert into Spelare (PersonNr,namn,ålder) values (198012125555,"Nicklas Jansson",41);
insert into Spelare (PersonNr,namn,ålder) values (200102091234,"Kalle Anka", 20);

insert into Tävling (Tävlingsnamn,Datum) values ("Big Golf Cup Skövde",'2021-06-10');

insert into delta(PersonNr,tävlingsnamn) values (199602091234,"Big Golf Cup Skövde");
insert into delta(PersonNr,tävlingsnamn) values (197002024321,"Big Golf Cup Skövde");
insert into delta(PersonNr,tävlingsnamn) values (198012125555,"Big Golf Cup Skövde");

insert into Regn (Typ,Vindstyrka) values ("Hagel", '10');
insert into Har(Typ,Tävlingsnamn,Tidpunkt) values ("Hagel", "Big Golf Cup Skövde",'14:00:00');
insert into Konstruktion(SerialNr,Hårdhet) values (1234, 10);
insert into Konstruktion(SerialNr,Hårdhet) values (4321, 5);
insert into jacka(storlek,material,modell,personnr) values ("xl","fleece","lyx",199602091234);
insert into jacka(storlek,material,modell,personnr) values ("xxl","goretex","budget",199602091234);
insert into Klubba(Nr,Material,PersonNr,SerialNr) values (1,"trä",199602091234,1234);
insert into Klubba(Nr,Material,PersonNr,SerialNr) values (2,"trä",197002024321,4321);

insert into Tävling (Tävlingsnamn,Datum) values ("Kalle Anka cupp",'2001-02-19');


select Namn,ålder from Spelare where Namn = "Johan Andersson";
select tävlingsnamn,datum from tävling where tävlingsnamn = "Big Golf Cup SKövde";
Select material from klubba where PersonNr = 199602091234;
select material from jacka where PersonNr = 199602091234;
select tävlingsnamn,delta.personnr,namn from delta,spelare where tävlingsnamn ="Big Golf Cup Skövde" && spelare.personnr = delta.personnr;
select regn.vindstyrka, har.tävlingsnamn from regn,har where har.tävlingsnamn= "Big Golf Cup Skövde";
select namn,ålder from spelare where (ålder<30);

delete from jacka where personnr = 199602091234;
select * from jacka where personnr = 199602091234;

SET FOREIGN_KEY_CHECKS=OFF;
delete from spelare where namn = "Nicklas Jansson";
SET FOREIGN_KEY_CHECKS=ON;
select * from spelare;

select AVG(ålder) as medelålder from spelare;
