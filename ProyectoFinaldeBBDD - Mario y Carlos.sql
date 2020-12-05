CREATE DATABASE Deportistas;
USE Deportistas;

-- Creación de tablas --
CREATE TABLE Jugador (
IDJUGADOR INT PRIMARY KEY AUTO_INCREMENT,
DEPORTE_ID INT NOT NULL,
NOMBRE VARCHAR (25) NOT NULL, 
APELLIDO1 VARCHAR (25) NOT NULL, 
APELLIDO2 VARCHAR (25) NOT NULL,
FECHA_NAC DATE,
PAIS_NAC VARCHAR (45) DEFAULT 'España', 
CIUDAD_NAC VARCHAR (45),
EDAD INT (2) NOT NULL,
PAIS_JUEGO VARCHAR (45),
PESO INT, 
ALTURA DECIMAL(3,2)
);

CREATE TABLE Deportes (
IDDEPORTE INT PRIMARY KEY AUTO_INCREMENT,
DEPORTE VARCHAR (30)
);

CREATE TABLE Titulos(
JUGADOR_ID INT NOT NULL,
DEPORTE_ID INT NOT NULL,
PALMARES TEXT,
CONSTRAINT FK_JUGADOR_TITULOS FOREIGN KEY (JUGADOR_ID) REFERENCES deportistas.Jugador (IDJUGADOR) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_DEPORTE_TITULOS FOREIGN KEY (DEPORTE_ID) REFERENCES deportistas.Deportes (IDDEPORTE) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Parejas_Juego (
JUGADOR_ID INT NOT NULL,
DEPORTE_ID INT NOT NULL,
PAREJA_JUEGO VARCHAR(25),
CONSTRAINT FK_JUGADOR_PAREJASJUEGO FOREIGN KEY (JUGADOR_ID) REFERENCES deportistas.Jugador (IDJUGADOR) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_DEPORTE_PAREJASJUEGO FOREIGN KEY (DEPORTE_ID) REFERENCES deportistas.Deportes (IDDEPORTE)ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Club_Anterior (
JUGADOR_ID INT NOT NULL,
DEPORTE_ID INT NOT NULL,
TRAYECTORIA TEXT,
CONSTRAINT FK_JUGADOR_CLUBANTERIOR FOREIGN KEY (JUGADOR_ID) REFERENCES deportistas.Jugador (IDJUGADOR) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_DEPORTE_CLUBANTERIOR FOREIGN KEY (DEPORTE_ID) REFERENCES deportistas.Deportes (IDDEPORTE) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Caracteristicas (
JUGADOR_ID INT NOT NULL,
DEPORTE_ID INT NOT NULL,
DORSAL INT (3),
CLUB VARCHAR (30),
POSICION VARCHAR (45),
CONSTRAINT FK_JUGADOR_CARACTERISTICAS FOREIGN KEY (JUGADOR_ID) REFERENCES deportistas.Jugador (IDJUGADOR) ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT FK_DEPORTE_CARACTERISTICAS FOREIGN KEY (DEPORTE_ID) REFERENCES deportistas.Deportes (IDDEPORTE) ON DELETE CASCADE ON UPDATE CASCADE
);

-- DATOS --
INSERT INTO deportistas.Deportes (DEPORTE) VALUES
('Fútbol'),
('Baloncesto'),
('Tenis'),
('Pádel'),
('Balonmano');

INSERT INTO deportistas.Jugador (DEPORTE_ID,NOMBRE,APELLIDO1,APELLIDO2,FECHA_NAC,CIUDAD_NAC,EDAD,PAIS_JUEGO,PESO,ALTURA) VALUES
(1,'Gerard','Moreno','Balagueró','1992/4/7','Santa Perpetua de Moguda',28,'España',75,1.78),
(1,'Mikel','Oyarzabal','Ugarte','1997/4/21','Eibar',23,'España',78,1.81),
(4,'Francisco','Navarro','Compán','1989/2/10','Sevilla',31,'España',75,1.81),
(5,'Ángel','Fernández','Pérez','1988/9/16','Cantabria',32,'Polonia',88,1.93),
(3,'Rafael','Nadal','Parera','1986/6/3','Manacor',34,'España',85,1.85),
(5,'Adrià','Figueras','Trejo','1988/8/31','Barcelona',32,'España',95,1.93),
(3,'Marc','López','Tarrés','1982/7/31','Barcelona',38,'España',72,1.75),
(2,'Felipe','Reyes','Cabanás','1980/3/16','Córdoba',40,'España',104,2.04),
(5,'Gonzalo','Pérez de Vargas','Moreno','1991/1/10','Toledo',29,'España',84,1.90),
(3,'Arantxa','Sánchez','Vicario','1971/12/18','Barcelona',48,'España',56,1.69),
(2,'Sergio','Rodríguez','Gómez','1986/6/12','Santa Cruz de Tenerife',34,'Italia',80,1.91),
(1,'Unai','Simón','Mendibil','1997/6/11','Múrgia',23,'España',89,1.90),
(1,'Sergio','Reguilón','Rodríguez','1996/12/16','Collado Villalba',23,'Inglaterra',68,1.78),
(2,'Ricard','Rubio','Vives','1990/10/21','El Masnou',30,'EEUU',82,1.93),
(4,'Alejandra','Salazar','Bengoechea','1985/12/31','Madrid',34,'España',60,1.68),
(4,'Juan','Lebrón','Chincoa','1995/1/30','Cádiz',25,'España',NULL,1.85),
(3,'Carla','Suárez','Navarro','1988/9/3','Las Palmas de Gran Canaria',32,'España',62,1.62),
(1,'Sergio','Ramos','García','1986/3/30','Camas',34,'España',82,1.84),
(4,'Alejandro','Galán','Romo','1996/5/15','Madrid',24,'España',NULL,1.86),
(4,'Ariana','Sánchez','Fallada','1997/7/19','Reus',23,'España',NULL,1.65),
(2,'Pau','Gasol','Sáez','1980/7/6','Barcelona',40,'EEUU',114,2.14),
(1,'David','de Gea','Quintana','1990/11/7','Madrid',30,'Inglaterra',76,1.89),
(4,'Marta','Ortega','Gallego','1997/2/14','Madrid',23,'España',NULL,1.70),
(5,'Rodrigo','Corrales','Rodal','1991/1/24','Pontevedra',29,'Hungría',111,2.02);

INSERT INTO deportistas.Titulos (JUGADOR_ID,DEPORTE_ID,PALMARES) VALUES
(1,1,'Trofeo Zarra 2019'),
(2,1,'Eurocopa Sub-21 2019'),
(3,4,'Marbella Master 2020'),
(4,5,'Liga Polonia 2020'),
(5,3,'Roland Garros 2020'),
(6,5,'Medalla de Oro 2020'),
(7,3,'Medalla de Oro 2016'),
(8,2,'Super Copa de España'),
(9,5,'Supercopa de España 2020'),
(10,3,'Gran Cruz de la Real Orden 2001'),
(11,2,'VTB United League 2019'),
(12,1,'Eurocopa Sub-21 2019'),
(13,1,'UEFA 2019-2020'),
(14,2,'Medalla de Oro 2019'),
(15,4,'Padel Pro Tour 2009'),
(16,4,'Alicante Open 2020'),
(18,1,'Supercopa de España 2020'),
(19,4,'Cascais Padel Master 2019'),
(20,4,'Master Final 2019'),
(21,2,'Anillo de oro 2009'),
(22,1,'Guante de Oro 2018'),
(23,4,'World Padel Tour Marbella 2019'),
(24,5,'Medalla de oro 2020');

INSERT INTO deportistas.Parejas_Juego (JUGADOR_ID,DEPORTE_ID,PAREJA_JUEGO) VALUES
(5,3,'Marcel Granollers'),
(7,3,'Feliciano López'),
(10,3,'Conchita Martínez'),
(17,3,'Garbiñe Muguruza'),
(3,4,'Pablo Lima'),
(15,4,'Ariana Sánchez'),
(16,4,'Alejandro Galán'),
(19,4,'Juan Lebrón'),
(20,4,'Alejandra Salazar');

INSERT INTO deportistas.Club_Anterior (JUGADOR_ID,DEPORTE_ID,TRAYECTORIA) VALUES
(1,1,'RCD Espanyol'),
(2,1,'Real Sociedad B'),
(12,1,'Bilbao Athletic'),
(13,1,'UD Logroñes'),
(18,1,'Sevilla FC'),
(8,2,'Club Baloncesto Estudiantes'),
(11,2,'CSKA Moscú'),
(14,2,'Phoenix Suns'),
(21,2,'San Antonio Spurs'),
(4,5,'Naturhouse La Rioja'),
(6,5,'FC Barcelona'),
(9,5,'Fenix Toulouse HB'),
(24,5,'PSG');

INSERT INTO deportistas.Caracteristicas (JUGADOR_ID,DEPORTE_ID,DORSAL,CLUB,POSICION) VALUES
(1,1,7,'Villarreal CF','Delantero'),
(2,1,10,'Real Sociedad','Centrocampista'),
(12,1,23,'Athletic Club','Portero'),
(13,1,3,'Tottenham Hotspur FC','Defensa'),
(18,1,4,'Real Madrid FC','Defensa'),
(8,2,9,'Real Madrid','Ala-Pívot'),
(11,2,13,'Pallacanestro Olimpia Milano','Base'),
(14,2,11,'Minnesota Timberwolves','Base'),
(21,2,16,'Milwaukee Bucks','Ala-Pívot'),
(4,5,6,'Vive Kielce','Lateral'),
(6,5,13,'Fraikin BM Granollers','Pivote'),
(9,5,1,'FC Barcelona Lassa','Portero'),
(24,5,1,'MKB Veszprém','Portero');

-- UPDATE --
UPDATE Club_Anterior SET TRAYECTORIA='Sevilla FC' WHERE TRAYECTORIA='UD Logroñes';
UPDATE deportistas.Caracteristicas SET CLUB='Fenix Toulouse HB' WHERE CLUB='FC Barcelona Lassa';

-- DELETE --
DELETE FROM deportistas.Jugador WHERE IDJUGADOR=12;
DELETE FROM deportistas.Jugador WHERE IDJUGADOR=17;

-- SELECT --
SELECT * FROM deportistas.Jugador;
SELECT Nombre,Apellido1,Apellido2,Edad,Ciudad_Nac FROM deportistas.Jugador WHERE DEPORTE_ID=1;