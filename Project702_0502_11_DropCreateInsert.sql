USE BUDT702_Project_0502_11;

DROP TABLE IF EXISTS [UMSoccer.Receive];
DROP TABLE IF EXISTS [UMSoccer.Make];
DROP TABLE IF EXISTS [UMSoccer.Play];
DROP TABLE IF EXISTS [UMSoccer.Result];
DROP TABLE IF EXISTS [UMSoccer.Foul];
DROP TABLE IF EXISTS [UMSoccer.Goal];
DROP TABLE IF EXISTS [UMSoccer.Game];
DROP TABLE IF EXISTS [UMSoccer.Location];
DROP TABLE IF EXISTS [UMSoccer.Opponent];

CREATE TABLE [UMSoccer.Opponent] (
	opponentId CHAR(3) NOT NULL,
    opponentSchool VARCHAR(50),
    opponentName VARCHAR(50),
	opponentConference BIT NOT NULL,
	CONSTRAINT pk_Opponent_opponentId PRIMARY KEY (opponentId) ); 

CREATE TABLE [UMSoccer.Location](
    locationId CHAR(3) NOT NULL,
    locationAddress VARCHAR(50),
    locationCity VARCHAR(50),
    locationState VARCHAR(50),
	locationZipcode CHAR(5),
    locationField VARCHAR(50),
    CONSTRAINT pk_Location_locationId PRIMARY KEY (locationId) );

CREATE TABLE [UMSoccer.Game](
	gameId CHAR(3) NOT NULL,
	gameDate DATE,
	gameAllocation CHAR(4),
	CONSTRAINT pk_Game_gameId PRIMARY KEY (gameId) );

CREATE TABLE [UMSoccer.Goal] (
    goalId CHAR(3) NOT NULL,
    goalTerpsAttempted INTEGER,
    goalTerpsMade INTEGER,
    goalOppAttempted INTEGER,
    goalOppMade INTEGER,
    CONSTRAINT pk_Goal_goalId PRIMARY KEY (goalId) );

CREATE TABLE [UMSoccer.Foul] (
    foulId CHAR(3) NOT NULL,
    yellowCardTerps INTEGER,
    redCardTerps INTEGER,
    yellowCardOpp INTEGER,
    redCardOpp INTEGER,
    CONSTRAINT pk_Foul_foulId PRIMARY KEY (foulId) );

CREATE TABLE [UMSoccer.Result] (
    resultId CHAR(3) NOT NULL,
    resultTerpsScore INT,
    resultOppScore INT,
    CONSTRAINT pk_Result_resultId PRIMARY KEY (resultId) );

CREATE TABLE [UMSoccer.Play] (
    gameId CHAR(3) NOT NULL,
    opponentId CHAR(3),
    locationId CHAR(3),
	CONSTRAINT pk_Play_gameId PRIMARY KEY (gameId),
    CONSTRAINT fk_Play_gameId FOREIGN KEY (gameId)
        REFERENCES [UMSoccer.Game](gameId)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_Play_opponentId FOREIGN KEY (opponentId)
        REFERENCES [UMSoccer.Opponent](opponentId)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT fk_Play_locationId FOREIGN KEY (locationId)
        REFERENCES [UMSoccer.Location](locationId)
        ON DELETE NO ACTION ON UPDATE CASCADE );

CREATE TABLE [UMSoccer.Make](
	gameId CHAR(3) NOT NULL,
	goalId CHAR(3),
	resultId CHAR(3),
	CONSTRAINT pk_Make_gameId PRIMARY KEY (gameId),
	CONSTRAINT fk_Make_gameId FOREIGN KEY (gameId)
		REFERENCES [UMSoccer.Game](gameId)
        ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Make_goalId FOREIGN KEY (goalId)
		REFERENCES [UMSoccer.Goal] (goalId)
		ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Make_resultId FOREIGN KEY (resultId)
		REFERENCES [UMSoccer.Result] (resultId)
		ON DELETE NO ACTION ON UPDATE CASCADE );

CREATE TABLE [UMSoccer.Receive] (
	gameId CHAR(3) NOT NULL,
	foulId CHAR(3),
	CONSTRAINT pk_Receive_gameId PRIMARY KEY (gameId),
	CONSTRAINT fk_Receive_gameId FOREIGN KEY (gameId)
		REFERENCES [UMSoccer.Game](gameId)
        ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT fk_Receive_foulId FOREIGN KEY (foulId)
		REFERENCES [UMSoccer.Foul] (foulId)
		ON DELETE NO ACTION ON UPDATE CASCADE )



--INSERT VALUES
INSERT INTO [UMSoccer.Opponent] VALUES
	('O01', 'Missouri State University', 'Missouri Bears', 'False'),
	('O02', 'University of North Carolina, Greensboro', 'Greensboro Spartans', 'False'),
	('O03', 'Wake Forest University', 'Demon Deacons', 'False'),
	('O04', 'University of Virginia', 'Virginia Cavaliers', 'False'),
	('O05', 'University of Michigan', 'Michigan Wolverines', 'True'),
	('O06', 'Penn State University', 'Nittany Lions', 'True'),
	('O07', 'University of Wisconsin', 'Wisconsin Badgers', 'True'),
	('O08', 'Northwestern University', 'Northwestern Wildcats', 'True'),
	('O09', 'Rutgers University', 'Scarlet Knights', 'True'),
	('O10', 'Bowling Green State University', 'Bowling Green Falcons', 'False'),
	('O11', 'Villanova University', 'Villanova Wildcats', 'False'),
	('O12', 'Michigan State University', 'Michigan State Spartans', 'True'),
	('O13', 'Indiana University', 'Indiana Hoosiers', 'True'),
	('O14', 'US Naval Academy', 'Navy Mdishipmen', 'False'),
	('O15', 'Ohio State University', 'Ohio State Buckeyes', 'True'),
	('O16', 'University of New Hampshire', 'New Hampshire Wildcats', 'False'),
	('O17', 'Liberty University', 'Liberty Flames', 'False'),
	('O18', 'Denver University', 'Denver Pioneers', 'False'),
	('O19', 'University of Virginia', 'Virginia Cavaliers', 'False'),
	('O20', 'Georgetown University', 'Georgetown Hoyas', 'False'),
	('O21', 'University of Michigan', 'Michigan Wolverines', 'True'),
	('O22', 'Penn State University', 'Nittany Lions', 'True'),
	('O23', 'Ohio State University', 'Ohio State Buckeyes', 'True'),
	('O24', 'Old Dominion University', 'Old Dominion Monarchs', 'False'),
	('O25', 'Rutgers University', 'Scarlet Knights', 'True'),
	('O26', 'Northwestern University', 'Northwestern Wildcats', 'True'),
	('O27', 'University of Wisconsin', 'Wisconsin Badgers', 'True'),
	('O28', 'High Point University', 'High Point Panthers', 'False'),
	('O29', 'Michigan State University', 'Michigan State Spartans', 'True'),
	('O30', 'University of Delaware', 'Fightin Blue Hens', 'False'),
	('O31', 'Indiana University', 'Indiana Hoosiers', 'True'),
	('O32', 'Northwestern University', 'Northwestern Wildcats', 'True'),
	('O33', 'Indiana University', 'Indiana Hoosiers', 'True'),
	('O34', 'Fairleigh Dickinson University', 'Fairleigh Knights', 'False'),
	('O35', 'Cornell University', 'Cornell Big Red', 'False'),
	('O36', 'Charelotte University', 'Charlotte 49ers', 'False'),
	('O37', 'University of Maryland, Baltimore County', 'UMBC Retrievers', 'False'),
	('O38', 'George Mason University', 'George Mason Patriots', 'False'),
	('O39', 'University of Virginia', 'Virginia Cavaliers', 'False'),
	('O40', 'Georgetown University', 'Georgetown Hoyas', 'False'),
	('O41', 'University of Michigan', 'Michigan Wolverines', 'True'),
	('O42', 'High Point University', 'High Point Panthers', 'False'),
	('O43', 'Ohio State University', 'Ohio State Buckeyes', 'True'),
	('O44', 'Rutgers University', 'Scarlet Knights', 'True'),
	('O45', 'University of Wisconsin', 'Wisconsin Badgers', 'True'),
	('O46', 'Northwestern University', 'Northwestern Wildcats', 'True'),
	('O47', 'University of Delaware', 'Fightin Blue Hens', 'False'),
	('O48', 'Pacific University', 'Pacific Boxers', 'False'),
	('O49', 'Michigan State University', 'Michigan State Spartans', 'True'),
	('O50', 'Penn State University', 'Nittany Lions', 'True'),
	('O51', 'Indiana University', 'Indiana Hoosiers', 'True'),
	('O52', 'Northwestern University', 'Northwestern Wildcats', 'True'),
	('O53', 'Long Island University', 'Long Island Sharks', 'False')

INSERT INTO [UMSoccer.Location] VALUES 
('L01', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L02', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L03', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L04', '407 Massie Rd', 'Charlottesville', 'VA', '22903', 'Kl�ckner Stadium'),
('L05', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L06', 'University Drive & E Park Ave', 'University Park', 'PA', '16802', 'Jeffrey Field'),
('L07', '750 Walnut St', 'Madison', 'WI', '53705', 'Dan McClimon Soccer Complex'),
('L08', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L09', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L10', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L11', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L12', 'DeMartin Soccer Stadium', 'East Lansing', 'MI', '48824', 'Old College Field at DeMartin Stadium'),
('L13', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L14', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L15', '2450 Fred Taylor Dr', 'Columbus', 'OH', '43210', 'Jesse Owens Memorial Stadium'),
('L16', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L17', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L18', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L19', '100 Potomac Ave SW', 'Washington', 'DC', '20024', 'Audi Field'),
('L20', '1580 West Rd', 'Washington', 'DC', '20057', 'Shaw Field'),
('L21', '2250 S State St', 'Ann Arbor', 'MI', '48103', 'U-M Soccer Stadium'),
('L22', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L23', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L24', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L25', '5808 Jackson St', 'West New York', 'NJ', '07093', 'Miller Family Soccer Complex'),
('L26', '2235 N Campus Dr', 'Evanston', 'IL', '60208', 'Lanny and Sharon Martin Stadium'),
('L27', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L28', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L29', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L30', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L31', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L32', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L33', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L34', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L35', '411 Tower Rd', 'Ithaca', 'NY', '14853', 'Berman Field'),
('L36', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L37', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L38', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L39', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L40', '1580 West Rd', 'Washington', 'DC', '20057', 'Shaw Field'),
('L41', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L42', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L43', '2450 Fred Taylor Dr', 'Columbus', 'OH', '43210', 'Jesse Owens Memorial Stadium'),
('L44', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L45', '750 Walnut St', 'Madison', 'WI', '53705', 'Dan McClimon Soccer Complex'),
('L46', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L47', 'Newark', 'Newark', 'DE', '19713', 'Grant Stadium'),
('L48', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L49', 'DeMartin Soccer Stadium', 'East Lansing', 'MI', '48824', 'Old College Field at DeMartin Stadium'),
('L50', 'University Drive & E Park Ave', 'University Park', '16802', 'PA', 'Jeffrey Field'),
('L51', '7898 Championship Ln', 'at Indiana', 'Away', '20742', 'Ludwig Field'),
('L52', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field'),
('L53', '7898 Championship Ln', 'College Park', 'MD', '20742', 'Ludwig Field')

INSERT INTO [UMSoccer.Game] VALUES
	('G01', '08/24/2023', 'Home'),
	('G02', '08/27/2023', 'Home'),
	('G03', '09/01/2023', 'Home'),
	('G04', '09/04/2023', 'Away'),
	('G05', '09/14/2023', 'Home'),
	('G06', '09/19/2023', 'Away'),
	('G07', '09/24/2023', 'Away'),
	('G08', '09/29/2023', 'Home'),
	('G09', '10/03/2023', 'Home'),
	('G10', '10/07/2023', 'Home'),
	('G11', '10/10/2023', 'Home'),
	('G12', '10/15/2023', 'Away'),
	('G13', '10/20/2023', 'Home'),
	('G14', '10/24/2023', 'Home'),
	('G15', '10/29/2023', 'Away'),
	('G16', '08/25/2022', 'Home'),
	('G17', '08/28/2022', 'Home'),
	('G18', '09/02/2022', 'Home'),
	('G19', '09/05/2022', 'Away'),
	('G20', '09/10/2022', 'Away'),
	('G21', '09/16/2022', 'Away'),
	('G22', '09/20/2022', 'Home'),
	('G23', '09/25/2022', 'Home'),
	('G24', '09/30/2022', 'Home'),
	('G25', '10/04/2022', 'Away'),
	('G26', '10/09/2022', 'Away'),
	('G27', '10/14/2022', 'Home'),
	('G28', '10/17/2022', 'Home'),
	('G29', '10/21/2022', 'Home'),
	('G30', '10/25/2022', 'Home'),
	('G31', '10/30/2022', 'Away'),
	('G32', '11/04/2022', 'Home'),
	('G33', '11/09/2022', 'Home'),
	('G34', '11/17/2022', 'Home'),
	('G35', '11/20/2022', 'Away'),
	('G36', '08/26/2021', 'Home'),
	('G37', '08/29/2021', 'Home'),
	('G38', '09/03/2021', 'Home'),
	('G39', '09/06/2021', 'Home'),
	('G40', '09/11/2021', 'Away'),
	('G41', '09/17/2021', 'Home'),
	('G42', '09/20/2021', 'Home'),
	('G43', '09/24/2021', 'Away'),
	('G44', '09/28/2021', 'Home'),
	('G45', '10/03/2021', 'Away'),
	('G46', '10/08/2021', 'Home'),
	('G47', '10/12/2021', 'Away'),
	('G48', '10/16/2021', 'Home'),
	('G49', '10/22/2021', 'Away'),
	('G50', '10/26/2021', 'Away'),
	('G51', '10/31/2021', 'Home'),
	('G52', '11/07/2021', 'Home'),
	('G53', '11/18/2021', 'Home')

INSERT INTO [UMSoccer.Goal] VALUES
	('H01', 1, 0, 5, 1),
	('H02', 7, 2, 6, 0),
	('H03', 3, 0, 0, 0),
	('H04', 6, 1, 7, 2),
	('H05', 5, 2, 2, 2),
	('H06', 5, 0, 5, 1),
	('H07', 1, 0, 2, 1),
	('H08', 7, 0, 6, 2),
	('H09', 11, 1, 3, 2),
	('H10', 6, 1, 3, 0),
	('H11', 16, 6, 8, 4),
	('H12', 5, 2, 4, 2),
	('H13', 5, 1, 3, 2),
	('H14', 7, 3, 2, 0),
	('H15', 2, 1, 9, 4),
	('H16', 5, 2, 1, 1),
	('H17', 6, 1, 2, 1),
	('H18', 5, 0, 8, 2),
	('H19', 9, 6, 4, 1),
	('H20', 7, 2, 6, 1),
	('H21', 4, 2, 7, 1),
	('H22', 10, 3, 7, 3),
	('H23', 2, 1, 1, 0),
	('H24', 6, 1, 7, 0),
	('H25', 5, 3, 4, 2),
	('H26', 7, 1, 3, 1),
	('H27', 11, 2, 4, 2),
	('H28', 5, 1, 2, 2),
	('H29', 8, 1, 0, 0),
	('H30', 5, 4, 3, 1),
	('H31', 4, 1, 3, 1),
	('H32', 8, 1, 3, 0),
	('H33', 2, 1, 4, 2),
	('H34', 8, 5, 8, 2),
	('H35', 5, 1, 6, 2),
	('H36', 8, 1, 1, 0),
	('H37', 6, 4, 7, 3),
	('H38', 5, 2, 2, 0),
	('H39', 11, 2, 1, 1),
	('H40', 1, 0, 7, 1),
	('H41', 10, 2, 2, 1),
	('H42', 5, 2, 3, 0),
	('H43', 7, 2, 5, 1),
	('H44', 7, 0, 3, 0),
	('H45', 2, 0, 7, 1),
	('H46', 10, 3, 3, 1),
	('H47', 9, 1, 0, 0),
	('H48', 6, 3, 0, 0),
	('H49', 5, 3, 4, 1),
	('H50', 5, 2, 7, 3),
	('H51', 11, 2, 4, 0),
	('H52', 10, 0, 6, 0),
	('H53', 5, 0, 2, 1)

INSERT INTO [UMSoccer.Foul] VALUES
	('F01', 1, 0, 3, 0),
	('F02', 1, 0, 2, 0),
	('F03', 1, 0, 5, 0),
	('F04', 3, 0, 4, 0),
	('F05', 3, 1, 3, 0),
	('F06', 1, 0, 1, 0),
	('F07', 0, 0, 1, 0),
	('F08', 5, 0, 2, 0),
	('F09', 1, 0, 3, 0),
	('F10', 1, 0, 2, 0),
	('F11', 3, 0, 1, 0),
	('F12', 3, 0, 2, 0),
	('F13', 3, 0, 0, 0),
	('F14', 0, 0, 0, 0),
	('F15', 1, 0, 1, 0),
	('F16', 3, 0, 3, 0),
	('F17', 2, 0, 4, 0),
	('F18', 2, 0, 1, 0),
	('F19', 1, 0, 2, 0),
	('F20', 2, 0, 1, 0),
	('F21', 3, 0, 2, 0),
	('F22', 3, 0, 1, 0),
	('F23', 1, 0, 1, 0),
	('F24', 2, 0, 1, 0),
	('F25', 2, 0, 2, 0),
	('F26', 1, 0, 2, 0),
	('F27', 0, 0, 2, 0),
	('F28', 0, 0, 4, 0),
	('F29', 4, 0, 6, 0),
	('F30', 1, 0, 0, 0),
	('F31', 1, 0, 1, 0),
	('F32', 1, 0, 2, 0),
	('F33', 4, 1, 0, 0),
	('F34', 2, 0, 5, 1),
	('F35', 1, 0, 3, 0),
	('F36', 3, 0, 2, 1),
	('F37', 0, 0, 1, 0),
	('F38', 1, 0, 2, 0),
	('F39', 0, 0, 1, 1),
	('F40', 3, 0, 2, 0),
	('F41', 1, 0, 2, 0),
	('F42', 1, 0, 1, 0),
	('F43', 1, 0, 1, 0),
	('F44', 2, 0, 5, 0),
	('F45', 1, 0, 1, 0),
	('F46', 0, 0, 3, 1),
	('F47', 1, 0, 5, 0),
	('F48', 1, 0, 2, 0),
	('F49', 1, 0, 1, 0),
	('F50', 2, 0, 2, 0),
	('F51', 3, 0, 0, 0),
	('F52', 0, 0, 1, 0),
	('F53', 1, 0, 4, 0)

INSERT INTO [UMSoccer.Result] VALUES
	('R01', 0, 1),
	('R02', 2, 0),
	('R03', 0, 0),
	('R04', 1, 2),
	('R05', 2, 2),
	('R06', 0, 1),
	('R07', 0, 1),
	('R08', 0, 2),
	('R09', 1, 2),
	('R10', 1, 0),
	('R11', 6, 4),
	('R12', 2, 2),
	('R13', 1, 2),
	('R14', 3, 0),
	('R15', 1, 4),
	('R16', 2, 1),
	('R17', 1, 1),
	('R18', 0, 2),
	('R19', 6, 1),
	('R20', 2, 1),
	('R21', 2, 1),
	('R22', 3, 3),
	('R23', 1, 0),
	('R24', 1, 0),
	('R25', 3, 2),
	('R26', 1, 1),
	('R27', 2, 2),
	('R28', 1, 2),
	('R29', 1, 0),
	('R30', 4, 1),
	('R31', 1, 1),
	('R32', 1, 0),
	('R33', 1, 2),
	('R34', 5, 2),
	('R35', 1, 2),
	('R36', 1, 0),
	('R37', 4, 3),
	('R38', 2, 0),
	('R39', 2, 1),
	('R40', 0, 1),
	('R41', 2, 1),
	('R42', 2, 0),
	('R43', 2, 1),
	('R44', 0, 0),
	('R45', 0, 1),
	('R46', 3, 1),
	('R47', 1, 0),
	('R48', 3, 0),
	('R49', 3, 1),
	('R50', 2, 3),
	('R51', 2, 0),
	('R52', 0, 0),
	('R53', 0, 1)

INSERT INTO [UMSoccer.Play] VALUES
	('G01', 'O01', 'L01'),
	('G02', 'O02', 'L02'),
	('G03', 'O03', 'L03'),
	('G04', 'O04', 'L04'),
	('G05', 'O05', 'L05'),
	('G06', 'O06', 'L06'),
	('G08', 'O07', 'L07'),
	('G09', 'O09', 'L09'),
	('G10', 'O10', 'L10'),
	('G11', 'O11', 'L11'),
	('G12', 'O12', 'L12'),
	('G13', 'O13', 'L13'),
	('G14', 'O14', 'L14'),
	('G15', 'O15', 'L15'),
	('G16', 'O16', 'L16'),
	('G17', 'O17', 'L17'),
	('G18', 'O18', 'L18'),
	('G19', 'O19', 'L19'),
	('G20', 'O20', 'L20'),
	('G21', 'O21', 'L21'),
	('G22', 'O22', 'L22'),
	('G23', 'O23', 'L23'),
	('G24', 'O24', 'L24'),
	('G25', 'O25', 'L25'),
	('G26', 'O26', 'L26'),
	('G27', 'O27', 'L27'),
	('G28', 'O28', 'L28'),
	('G29', 'O29', 'L29'),
	('G30', 'O30', 'L30'),
	('G31', 'O31', 'L31'),
	('G32', 'O32', 'L32'),
	('G33', 'O33', 'L33'),
	('G34', 'O34', 'L34'),
	('G35', 'O35', 'L35'),
	('G36', 'O36', 'L36'),
	('G37', 'O37', 'L37'),
	('G38', 'O38', 'L38'),
	('G39', 'O39', 'L39'),
	('G40', 'O40', 'L40'),
	('G41', 'O41', 'L41'),
	('G42', 'O42', 'L42'),
	('G43', 'O43', 'L43'),
	('G44', 'O44', 'L44'),
	('G45', 'O45', 'L45'),
	('G46', 'O46', 'L46'),
	('G47', 'O47', 'L47'),
	('G48', 'O48', 'L48'),
	('G49', 'O49', 'L49'),
	('G50', 'O50', 'L50'),
	('G51', 'O51', 'L51'),
	('G52', 'O52', 'L52'),
	('G53', 'O53', 'L53')

INSERT INTO [UMSoccer.Make] VALUES
	('G01', 'H01', 'R01'),
	('G02', 'H02', 'R02'),
	('G03', 'H03', 'R03'),
	('G04', 'H04', 'R04'),
	('G05', 'H05', 'R05'),
	('G06', 'H06', 'R06'),
	('G07', 'H07', 'R07'),
	('G08', 'H08', 'R08'),
	('G09', 'H09', 'R09'),
	('G10', 'H10', 'R10'),
	('G11', 'H11', 'R11'),
	('G12', 'H12', 'R12'),
	('G13', 'H13', 'R13'),
	('G14', 'H14', 'R14'),
	('G15', 'H15', 'R15'),
	('G16', 'H16', 'R16'),
	('G17', 'H17', 'R17'),
	('G18', 'H18', 'R18'),
	('G19', 'H19', 'R19'),
	('G20', 'H20', 'R20'),
	('G21', 'H21', 'R21'),
	('G22', 'H22', 'R22'),
	('G23', 'H23', 'R23'),
	('G24', 'H24', 'R24'),
	('G25', 'H25', 'R25'),
	('G26', 'H26', 'R26'),
	('G27', 'H27', 'R27'),
	('G28', 'H28', 'R28'),
	('G29', 'H29', 'R29'),
	('G30', 'H30', 'R30'),
	('G31', 'H31', 'R31'),
	('G32', 'H32', 'R32'),
	('G33', 'H33', 'R33'),
	('G34', 'H34', 'R34'),
	('G35', 'H35', 'R35'),
	('G36', 'H36', 'R36'),
	('G37', 'H37', 'R07'),
	('G38', 'H38', 'R38'),
	('G39', 'H39', 'R39'),
	('G40', 'H40', 'R40'),
	('G41', 'H41', 'R41'),
	('G42', 'H42', 'R42'),
	('G43', 'H43', 'R43'),
	('G44', 'H44', 'R44'),
	('G45', 'H45', 'R45'),
	('G46', 'H46', 'R46'),
	('G47', 'H47', 'R47'),
	('G48', 'H48', 'R48'),
	('G49', 'H49', 'R49'),
	('G50', 'H50', 'R50'),
	('G51', 'H51', 'R51'),
	('G52', 'H52', 'R52'),
	('G53', 'H53', 'R53')

INSERT INTO [UMSoccer.Receive] VALUES
	('G01', 'F01'),
	('G02', 'F02'),
	('G03', 'F03'),
	('G04', 'F04'),
	('G05', 'F05'),
	('G06', 'F06'),
	('G07', 'F07'),
	('G08', 'F08'),
	('G09', 'F09'),
	('G10', 'F10'),
	('G11', 'F11'),
	('G12', 'F12'),
	('G13', 'F13'),
	('G14', 'F14'),
	('G15', 'F15'),
	('G16', 'F16'),
	('G17', 'F17'),
	('G18', 'F18'),
	('G19', 'F19'),
	('G20', 'F20'),
	('G21', 'F21'),
	('G22', 'F22'),
	('G23', 'F23'),
	('G24', 'F24'),
	('G25', 'F25'),
	('G26', 'F26'),
	('G27', 'F27'),
	('G28', 'F28'),
	('G29', 'F29'),
	('G30', 'F30'),
	('G31', 'F31'),
	('G32', 'F32'),
	('G33', 'F33'),
	('G34', 'F34'),
	('G35', 'F35'),
	('G36', 'F36'),
	('G37', 'F37'),
	('G38', 'F38'),
	('G39', 'F39'),
	('G40', 'F40'),
	('G41', 'F41'),
	('G42', 'F42'),
	('G43', 'F43'),
	('G44', 'F44'),
	('G45', 'F45'),
	('G46', 'F46'),
	('G47', 'F47'),
	('G48', 'F48'),
	('G49', 'F49'),
	('G50', 'F50'),
	('G51', 'F51'),
	('G52', 'F52'),
	('G53', 'F53')