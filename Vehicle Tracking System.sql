create Table Vehicle_Owner(
	Owner_NIC varchar(10) NOT NULL,
	fname varchar(50) NOT NULL,
	lnanme varchar(50),
	email varchar(50)
		
		constraint O_NIC Primary key(Owner_NIC),
		constraint chk_ONIC check (Owner_NIC like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][a-z\A-Z]')),
)

create Table Vehicle_Owner_Phone(
	Owner_NIC varchar(10) NOT NULL,
	mobile_1 int NOT NULL,
	mobile_2 int

		constraint Own_NIC foreign key(Owner_NIC) references Vehicle_Owner(Owner_NIC),
		constraint chk_Nic check (Owner_NIC like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][a-z\A-Z]')),
		constraint chk_mob1 check (mobile_1 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
		constraint chk_mob2 check (mobile_2 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

create Table Vehicle(
	Vehicle_No varchar(10) NOT NULL,
	vehicle_type varchar(20) NOT NULL,
	fuel_type varchar(20),
	Owner_NIC varchar(10) NOT NULL

		constraint V_N Primary key(Vehicle_No),
		constraint Ow_NIC Foreign key(Owner_NIC) references Vehicle_Owner(Owner_NIC),
		constraint chk_OWNIC check (Owner_NIC like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][a-z\A-Z]')),
)

create Table Driver(
	Licence_No int NOT NULL,
	NIC varchar(10) NOT NULL,
	fname varchar(50) NOT NULL,
	lnanme varchar(50),
	email varchar(50),
	Vehicle_No varchar(10) NOT NULL

		constraint L_N Primary key(Licence_No),
		constraint Veh_N Foreign key(Vehicle_No) references Vehicle(Vehicle_No), 
		constraint chk_nicc check (NIC like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][a-z\A-Z]')),
)

create Table Driver_Phone(
	Licence_No int NOT NULL,
	mobile_1 int NOT NULL,
	mobile_2 int,

		constraint Li_No foreign key(Licence_No) references Driver(Licence_No),
		constraint chk_mo1 check (mobile_1 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')),
		constraint chk_mo2 check (mobile_2 like('[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'))
)

create Table Location(
	Location_ID varchar(50) NOT NULL,
	time varchar(5) NOT NULL,
	latitude varchar(20),
	longitude varchar(20),
	Vehicle_No varchar(10) NOT NULL

		constraint L_ID Primary key(Location_ID),
		constraint V_NO Foreign key(Vehicle_No) references Vehicle(Vehicle_No)
)

insert into Vehicle_Owner(Owner_NIC,fname,lnanme,email)
	values	('800075659V','Saman','Rajapaksha','abc@gmail.com'),
			('826598456V','Ruwan','Kumara','bcd@gmail.com'),
			('896542123V','Sanka','Gunasiri','cde@gmail.com'),
			('694563789V','Jayalath','Bandara','def@gmail.com'),
			('758964123V','Chathura','Senarathna','efg@gmail.com'),
			('602365895V','Chinthaka','Jayasinha',''),
			('769548632V','Rathnapala','','fgh@gmail.com'),
			('689875123V','Sagara','Almedha','ghi@yahoo.com')

insert into Vehicle_Owner_Phone(Owner_NIC, mobile_1, mobile_2)
	values	('800075659V',0775689123,0774582164),
			('826598456V',0757896321,0714589654),
			('896542123V',0705469325,0769854263),
			('694563789V',0769852458,0784569375),
			('758964123V',0713698754,0775869324),
			('602365895V',0786932532,0758423694),
			('769548632V',0782145789,0715469825),
			('689875123V',0773652148,0715469382)

insert into Vehicle(Vehicle_No, vehicle_type, fuel_type, Owner_NIC)
	values	('NA-5862','Bus','Desel','800075659V'),
			('NG-4586','Bus','Desel','800075659V'),
			('NC-4582','Bus','Desel','826598456V'),
			('NB-4632','Bus','Desel','896542123V'),
			('CAA-7896','Car','Petrol','694563789V'),
			('PG-4856','Van','Petrol','694563789V'),
			('253-7896','Van','Desel','758964123V'),
			('62-5698','Bus','Desel','602365895V'),
			('56-0884','Van','Desel','602365895V'),
			('NB-4455','Bus','Desel','800075659V'),
			('KO-9196','Car','Petrol','769548632V'),
			('KR-4596','Car','Petrol','769548632V'),
			('CAB-7896','Car','Petrol','689875123V'),
			('28-8569','Lorry','Desel','689875123V')
	
insert into Driver(Licence_No, NIC, fname, lnanme, email, Vehicle_No)
	values	(56458945,'652358989V','Tharindu','Kostha','abcd@yahoo.com','NA-5862'),
			(45896575,'756314581V','Ranil','Wickramasinghe','bcde@gmail.com','NG-4586'),
			(78965324,'789652521V','Mangala','Samaraveera','cdef@gmail.com','NC-4582'),
			(78956423,'851525215V','Samaraveera','Mudali','defg@yahoo.com','NB-4632'),
			(54789562,'824578526V','Gayan','Sudesh','efgh@gmail.com','CAA-7896'),
			(47856215,'785426952V','Kushan','Madusanka','fghi@gmail.com','PG-4856'),
			(20230332,'736982145V','Siril','Sugathadasa','ghij@gmail.com','253-7896'),
			(15321356,'685478925V','Buddi','Krishan','hijK@gmail.com','62-5698'),
			(15321786,'685478925V','Buddi','Krishan','hijK@gmail.com','56-0884'),
			(78926432,'865429525V','Thushara','Jayalath','ijkl@gmail.com','NB-4455'),
			(14785962,'875698524V','Sagara','Bandara','jklm@gmail.com','KO-9196'),
			(65898755,'745892155V','Dasun','','klmn@gmail.com','KR-4596'),
			(12548651,'654646512V','Nandana','','mnop@gmail,com','CAB-7896'),
			(78965212,'854263155V','Herath','Mudali','nopq@yahoo.com','28-8569')

insert into Driver_Phone(Licence_No, mobile_1, mobile_2)
	values	(56458945,0783152789,0756616165),
			(45896575,0756985531,0775166559),
			(78965324,0773211356,0716556655),
			(78956423,0761362126,0785661656),
			(54789562,0701532321,0759499568),
			(47856215,0776365531,0709999895),
			(20230332,0763313153,0704646984),
			(15321356,0773213513,0715551155),
			(15321786,0716785845,0774877854),
			(78926432,0716133335,0784556556),
			(14785962,0716650632,0774949449),
			(65898755,0776156655,0719449549),
			(12548651,0773153311,0769516651),
			(78965212,0756664665,0764849626)

insert into Location(Location_ID, time, latitude, longitude, Vehicle_No)
	values	('6565SSTSfgcggSD651','15.33','6.585395','79.960739','NA-5862'),
			('SDttrguyui1l651965','12.45','6.124593','81.101074','NG-4586'),
			('56516kjnkjhSDfsffc','22.32','8.592200','81.196793','NC-4582'),
			('gh33131SDdg656156h','6.55','8.592200','81.196793','NB-4632'),
			('dfg45159919REeetrf','5.46','6.894070','79.902481','CAA-7896'),
			('56659kjkjkSDffdcin','3.33','7.189464','79.858734','PG-4856'),
			('45242mnbnbjFDDFGhg','4.52','6.053519','80.220978','253-7896'),
			('SSGdtgxtggtr16l556','8.36','6.872916','79.888634','62-5698'),
			('hgvhvghDFFFFfzf549','9.41','6.927079','79.861244','56-0884'),
			('fgh65161897896nbRE','10.50','7.291418','80.636696','NB-4455'),
			('SADAFfddfxc26519bh','11.50','7.181254','79.858954','KO-9196'),
			('541kbjbjbhvhgcSdfg','17.44','6.075519','80.250978','KR-4596'),
			('165mnbvggfsfsSfGgh','20.30','6.952079','79.861694','CAB-7896'),
			('655468kjbhDDSFGgh5','22.35','8.502200','81.105793','28-8569')


select *
from Location



drop table Vehicle_Owner
drop table Vehicle
drop table Driver
drop table Driver_Phone
drop table Vehicle_Owner_Phone
drop table Location




	