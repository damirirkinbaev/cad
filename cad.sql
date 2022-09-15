-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 23 2022 г., 07:07
-- Версия сервера: 5.6.38
-- Версия PHP: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `mdtcad`
--

-- --------------------------------------------------------

--
-- Структура таблицы `active_users`
--

CREATE TABLE `active_users` (
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL COMMENT 'Unit Callsign',
  `status` int(11) NOT NULL COMMENT 'Unit status, 0=busy/unavailable, 1=available, 2=dispatcher',
  `status_detail` int(11) NOT NULL COMMENT 'Paired to Statuses table',
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `agency`
--

CREATE TABLE `agency` (
  `agency_id` int(11) NOT NULL,
  `agency_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `agency`
--

INSERT INTO `agency` (`agency_id`, `agency_name`) VALUES
(1, 'Моторизированный юнит (Motorbike Unit, MBU)'),
(2, 'Отдел воздушной поддержки (Air Support Division, ASD)'),
(3, 'Детективное бюро (DBU)'),
(4, 'Парк Рейнджеры (Wildlife Ranger, WR)'),
(5, 'Отдел специального назначения (Special Enforcement Bureau, SEB)'),
(6, 'Администрация порта (Port Authority Unit, PAU)'),
(7, 'Дивизия спасательных операций (Division of special operations, DSO)');

-- --------------------------------------------------------

--
-- Структура таблицы `agency_users`
--

CREATE TABLE `agency_users` (
  `newid` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `agency_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `aop`
--

CREATE TABLE `aop` (
  `aop` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aop2` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aop3` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_time` time NOT NULL,
  `issued_by` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `aop`
--

INSERT INTO `aop` (`aop`, `aop2`, `aop3`, `issued_date`, `issued_time`, `issued_by`) VALUES
('Paleto Bay', '', '', '2022-08-23', '06:55:42', 'Aleksey S.');

-- --------------------------------------------------------

--
-- Структура таблицы `bolos_persons`
--

CREATE TABLE `bolos_persons` (
  `id` int(11) NOT NULL,
  `first_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'First name of BOLO suspect.',
  `last_name` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Last name of BOLO suspect.',
  `gender` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Gender of BOLO suspect.',
  `physical_description` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Physical description of BOLO suspect.',
  `reason_wanted` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Reason BOLO suspect is wanted.',
  `last_seen` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Last observed location of BOLO suspect.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `bolos_vehicles`
--

CREATE TABLE `bolos_vehicles` (
  `id` int(11) NOT NULL,
  `vehicle_make` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Make of BOLO vehicle.',
  `vehicle_model` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Model of BOLO vehicle.',
  `vehicle_plate` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'License of BOLO vehicle.',
  `primary_color` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Primary color of BOLO vehicle.',
  `secondary_color` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Secondary color of BOLO vehicle.',
  `reason_wanted` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Reason BOLO suspect is wanted.',
  `last_seen` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT 'Last observed location of BOLO vehicle.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `calls`
--

CREATE TABLE `calls` (
  `call_id` int(11) NOT NULL,
  `call_type` text CHARACTER SET utf8 NOT NULL,
  `call_primary` text CHARACTER SET utf8,
  `call_street1` text CHARACTER SET utf8 NOT NULL,
  `call_street2` text CHARACTER SET utf8,
  `call_street3` text CHARACTER SET utf8,
  `call_narrative` text CHARACTER SET utf8 NOT NULL,
  `call_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `calls_users`
--

CREATE TABLE `calls_users` (
  `call_id` int(11) NOT NULL,
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `call_history`
--

CREATE TABLE `call_history` (
  `call_id` int(11) NOT NULL,
  `call_type` text CHARACTER SET utf8 NOT NULL,
  `call_primary` text CHARACTER SET utf8,
  `call_street1` text CHARACTER SET utf8 NOT NULL,
  `call_street2` text CHARACTER SET utf8,
  `call_street3` text CHARACTER SET utf8,
  `call_narrative` text CHARACTER SET utf8 NOT NULL,
  `call_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `call_list`
--

CREATE TABLE `call_list` (
  `call_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `call_list`
--

INSERT INTO `call_list` (`call_id`) VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11);

-- --------------------------------------------------------

--
-- Структура таблицы `chat`
--

CREATE TABLE `chat` (
  `userId` int(11) NOT NULL,
  `chat_text` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `time` text NOT NULL,
  `rank` varchar(255) NOT NULL,
  `avatar` text NOT NULL,
  `fordelete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `citations`
--

CREATE TABLE `citations` (
  `id` int(11) NOT NULL,
  `citation_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `civilian_names`
--

CREATE TABLE `civilian_names` (
  `user_id` int(11) NOT NULL COMMENT 'Links to users table',
  `names_id` int(11) NOT NULL COMMENT 'Links to names table'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `color_group` varchar(255) DEFAULT NULL,
  `color_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `colors`
--

INSERT INTO `colors` (`id`, `color_group`, `color_name`) VALUES
(1, 'Хромированный', 'Хромированный'),
(2, 'Черный', 'Черный'),
(3, 'Серебристый', 'Серебристый'),
(4, 'Красный', 'Красный'),
(5, 'Розовый', 'Розовый'),
(6, 'Оранжевый', 'Оранжевый'),
(7, 'Золотой', 'Золотой'),
(8, 'Желтый', 'Желтый'),
(9, 'Зелёный', 'Зелёный'),
(10, 'Синий', 'Синий'),
(11, 'Коричневый', 'Коричневый'),
(12, 'Фиолетовый', 'Фиолетовый'),
(13, 'Кремовый', 'Кремовый'),
(14, 'Белый', 'Белый');

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) DEFAULT NULL COMMENT 'The functional name of the department. (eg. Police, Fire, EMS)',
  `department_short_name` varchar(10) NOT NULL COMMENT 'The name of the department. (eg. Los Angeles Police Department, Blaine County Sheriffs'' Office',
  `department_long_name` varchar(255) NOT NULL COMMENT 'The acronym of the department name. (eg. BCSO, LAPD, LAFD)',
  `allow_department` int(11) NOT NULL COMMENT 'If 0 then department is disabled, if 1 then department is enabled.'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `department_short_name`, `department_long_name`, `allow_department`) VALUES
(1, 'Communications', 'SAECOMM', 'San Andreas Emergency Communications', 0),
(2, 'State', 'SASP', 'San Andreas State Police', 0),
(3, 'Highway', 'SAHP', 'San Andreas Highway Patrol', 0),
(4, 'Sheriff', 'BCSO', 'Blaine County Sheriffs\' Office', 0),
(5, 'Police', 'SAPD', 'San Andreas Police Department', 0),
(6, 'Fire', 'SAFD', 'San Andreas Fire Department', 0),
(7, 'EMS', 'SAEMS', 'San Andreas Emergency Services', 0),
(8, 'Civilian', 'SACS', 'San Andreas Civilian Services', 0),
(9, 'Roadside Assist', 'SARA', 'San Andreas Roadside Assistance', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `dispatchers`
--

CREATE TABLE `dispatchers` (
  `identifier` varchar(255) NOT NULL,
  `callsign` varchar(255) NOT NULL COMMENT 'Unit Callsign',
  `status` int(11) NOT NULL COMMENT 'Unit status, 0=offline, 1=online'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `dispatchers`
--

INSERT INTO `dispatchers` (`identifier`, `callsign`, `status`) VALUES
('1K-382', '1K-382', 0),
('82-1938', '82-1938', 0),
('C-2442', 'C-2442', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `genders`
--

CREATE TABLE `genders` (
  `id` int(11) NOT NULL,
  `genders` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `genders`
--

INSERT INTO `genders` (`id`, `genders`) VALUES
(0, 'Мужской'),
(1, 'Женский');

-- --------------------------------------------------------

--
-- Структура таблицы `incident_type`
--

CREATE TABLE `incident_type` (
  `code_id` varchar(255) NOT NULL DEFAULT '',
  `code_name` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `incident_type`
--

INSERT INTO `incident_type` (`code_id`, `code_name`) VALUES
('62', 'ПРОЧЕЕ'),
('13', 'ВЫСТРЕЛЫ'),
('17', 'ЭКСТРЕННАЯ СИТУАЦИЯ'),
('11', 'ОСТАНОВКА С АВТОМОБИЛЕМ'),
('200', 'ПОЖАР');

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_arrests`
--

CREATE TABLE `ncic_arrests` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `arrest_reason` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_citations`
--

CREATE TABLE `ncic_citations` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0 = Paid, 1 = Approved/Active',
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `citation_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_evacuation`
--

CREATE TABLE `ncic_evacuation` (
  `id` int(11) NOT NULL,
  `veh_plate` mediumtext NOT NULL,
  `evacuation_reason` varchar(255) NOT NULL,
  `issued_date` date NOT NULL,
  `issued_by` varchar(255) CHARACTER SET latin1 NOT NULL,
  `location` varchar(255) CHARACTER SET latin1 NOT NULL,
  `evacuation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_names`
--

CREATE TABLE `ncic_names` (
  `id` int(11) NOT NULL,
  `submittedByName` varchar(255) NOT NULL,
  `submittedById` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dob` date NOT NULL COMMENT 'Date of birth',
  `address` mediumtext NOT NULL,
  `gender` varchar(255) NOT NULL,
  `race` mediumtext NOT NULL,
  `dl_status` mediumtext NOT NULL,
  `hair_color` mediumtext NOT NULL,
  `build` mediumtext NOT NULL,
  `weapon_permit` varchar(255) NOT NULL,
  `deceased` varchar(255) NOT NULL,
  `decAllergies` varchar(255) NOT NULL,
  `decDrugs` varchar(255) NOT NULL,
  `decContact` varchar(255) NOT NULL,
  `civJob` text NOT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_plates`
--

CREATE TABLE `ncic_plates` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Links to ncic_names db for driver information',
  `veh_plate` mediumtext NOT NULL,
  `veh_make` mediumtext NOT NULL,
  `veh_model` mediumtext NOT NULL,
  `veh_pcolor` mediumtext NOT NULL,
  `veh_scolor` mediumtext NOT NULL,
  `veh_insurance` mediumtext NOT NULL,
  `flags` mediumtext,
  `notes` mediumtext COMMENT 'Any special flags visible to dispatchers',
  `veh_reg_state` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_warnings`
--

CREATE TABLE `ncic_warnings` (
  `id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 = Pending, 1 = Approved/Active',
  `name_id` int(11) NOT NULL COMMENT 'Paired to ID of ncic_names table',
  `warning_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issued_date` date DEFAULT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_warrants`
--

CREATE TABLE `ncic_warrants` (
  `id` int(11) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `warrant_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Key that pairs to the ncic_name id',
  `issued_date` date DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `issuing_agency` varchar(255) CHARACTER SET utf8 NOT NULL,
  `issued_by` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `ncic_weapons`
--

CREATE TABLE `ncic_weapons` (
  `id` int(11) NOT NULL,
  `name_id` int(11) NOT NULL COMMENT 'Links to ncic_names db for driver information',
  `weapon_type` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `ncic_weapons`
--

INSERT INTO `ncic_weapons` (`id`, `name_id`, `weapon_type`, `weapon_name`, `user_id`) VALUES
(2, 5, 'Pistols', 'Pistol', 229);

-- --------------------------------------------------------

--
-- Структура таблицы `permissions`
--

CREATE TABLE `permissions` (
  `perm_id` int(11) NOT NULL,
  `perm_desc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `ranks`
--

CREATE TABLE `ranks` (
  `rank_id` int(11) NOT NULL,
  `rank_name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `can_choose` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `ranks`
--

INSERT INTO `ranks` (`rank_id`, `rank_name`, `can_choose`) VALUES
(1, 'CADET', 0),
(2, 'CAPTAIN (CPT)', 0),
(4, 'TROOPER III ASD (ASDTRIII)', 0),
(5, 'Lieutenant (LT)', 0),
(6, 'DEPUTY I WR (WRSDI)', 0),
(7, 'OFFICER I (POI)', 0),
(8, 'OFFICER II (POII)', 0),
(9, 'OFFICER II PAU (PAUPOII)', 0),
(10, 'OFFICER III (POIII)', 0),
(11, 'OFFICER III PAU (PAUPOIII)', 0),
(12, 'DETECTIVE I DBU (PDI)', 0),
(13, 'DETECTIVE II DBU (PDII)', 0),
(14, 'SERGEANT I﻿ (SGI)', 0),
(15, 'SERGEANT I PAU (PAUSGI)', 0),
(16, 'DETECTIVE III DBU (PDIII)', 0),
(17, 'SERGEANT II﻿ (SGII)', 0),
(18, 'LIEUTENANT﻿﻿﻿ (LT)', 0),
(19, 'LIEUTENANT PAU﻿﻿ (PAULT)', 0),
(20, 'LIEUTENANT DBU (DBULT)', 0),
(21, 'COMMANDER﻿ (CMD)', 0),
(22, 'CHIEF﻿ (CHF)', 0),
(23, 'TROOPER I (TRI)', 0),
(24, 'TROOPER I MBU (MBUTRI)', 0),
(25, 'TROOPER II﻿ (TRII)', 0),
(26, 'TROOPER II MBU (MBUTRII)', 0),
(27, 'TROOPER III﻿ (TRIII)', 0),
(28, 'TROOPER III MBU (MBUTRIII)', 0),
(29, 'TROOPER III ASD (ASDTRIII)', 0),
(30, 'SERGEANT I MBU (MBUSGI)', 0),
(31, 'SERGEANT I ASD (ASDSGI)', 0),
(32, 'LIEUTENANT MBU (MBULT)', 0),
(33, 'LIEUTENANT ASD (ASDLT)', 0),
(34, 'COMMISSIONER (CSS)', 0),
(35, 'DEPUTY I (SDI)', 0),
(36, 'DEPUTY II (SDII)', 0),
(37, 'DEPUTY II WR (WRSDII)', 0),
(38, 'DEPUTY III (SDIII)', 0),
(39, 'DEPUTY III WR (WRSDIII)', 0),
(40, 'DEPUTY III SEB (SEBSDIII)', 0),
(41, 'SERGEANT I WR﻿ (WRSGI)', 0),
(42, 'SERGEANT I SEB (SEBSGI)', 0),
(43, 'LIEUTENANT WR (WRLT)', 0),
(44, 'LIEUTENANT SEB (SEBLT)', 0),
(45, 'SHERIFF (SHF)', 0),
(46, 'EMS PARAMEDIC II (EPMII)', 0),
(47, 'EMS PARAMEDIC III (EPMIII)', 0),
(48, 'EMS CAPTAIN (ECPT)', 0),
(49, 'EMS DIVISION CHIEF (ECHF)', 0),
(50, 'FIREFIGHTER II (FFTII)', 0),
(51, 'EMS PARAMEDIC I (EPMI)', 0),
(52, 'EMS PHYSICIAN (EPH)', 0),
(53, 'EMS LIEUTENANT (ELT)', 0),
(54, 'FIREFIGHTER I (FFTI)', 0),
(55, 'FIREFIGHTER III (FFTIII)', 0),
(56, 'FD MARSHALL (FML)', 0),
(57, 'FD LIEUTENANT (FLT)', 0),
(58, 'FD CAPTAIN (FCPT)', 0),
(59, 'FD CHIEF (FCHF)', 0),
(60, 'LIFESAVING DEPARTMENT CHIEF (LDCHF)', 0),
(61, 'BATTALION CHIEF (BCHF)', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ranks_users`
--

CREATE TABLE `ranks_users` (
  `user_id` int(11) NOT NULL,
  `rank_id` int(11) NOT NULL,
  `fordelete` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `ranks_users`
--

INSERT INTO `ranks_users` (`user_id`, `rank_id`, `fordelete`) VALUES
(20, 5, 12),
(12, 5, 11),
(18, 6, 10),
(13, 4, 4),
(49, 1, 56),
(19, 4, 9),
(10, 5, 7),
(17, 1, 8),
(24, 1, 18),
(49, 1, 57),
(26, 1, 20),
(27, 1, 21),
(20, 1, 22),
(28, 1, 23),
(12, 5, 24),
(10, 5, 25),
(29, 1, 26),
(18, 1, 27),
(18, 6, 28),
(30, 1, 29),
(31, 1, 30),
(32, 1, 31),
(34, 1, 32),
(17, 1, 33),
(32, 1, 34),
(35, 1, 35),
(36, 1, 36),
(29, 1, 37),
(35, 1, 38),
(37, 1, 39),
(38, 1, 40),
(40, 1, 41),
(39, 1, 42),
(44, 1, 43),
(46, 1, 44),
(47, 1, 45),
(17, 1, 46),
(16, 1, 47),
(22, 1, 48),
(47, 1, 49),
(48, 2, 50),
(47, 1, 51),
(47, 1, 52),
(16, 1, 53),
(17, 1, 54),
(16, 2, 55),
(50, 1, 58),
(51, 1, 59),
(52, 1, 60),
(53, 1, 61),
(50, 1, 62),
(54, 1, 63);

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `report_description` text NOT NULL,
  `issued_by` varchar(255) NOT NULL,
  `issued_date` date DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reports_dispatch`
--

CREATE TABLE `reports_dispatch` (
  `identifier` varchar(255) NOT NULL,
  `signal100` int(11) NOT NULL,
  `panic` int(11) NOT NULL,
  `priority` int(11) NOT NULL,
  `dispatch_description` text NOT NULL,
  `date` datetime DEFAULT NULL,
  `fordelete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `reports_units`
--

CREATE TABLE `reports_units` (
  `identifier` varchar(255) NOT NULL,
  `warning` text NOT NULL,
  `warning_description` text NOT NULL,
  `issued_date` date NOT NULL,
  `issued_by` varchar(255) NOT NULL,
  `fordelete` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL,
  `status_text` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `statuses`
--

INSERT INTO `statuses` (`status_id`, `status_text`) VALUES
(1, '10-8 | ДОСТУПЕН'),
(2, '10-6 | ЗАНЯТ'),
(3, '10-7 | НА ВЫЗОВЕ'),
(4, '10-5 | Meal Break'),
(5, 'Signal 11'),
(6, '10-7 | ВНЕ СЛУЖБЫ'),
(7, '10-23 | ПРИБЫЛ НА СЦЕНУ'),
(8, '10-65 | Transporting Prisoner');

-- --------------------------------------------------------

--
-- Структура таблицы `streets`
--

CREATE TABLE `streets` (
  `id` int(11) NOT NULL COMMENT 'Primary key for each street',
  `name` text NOT NULL COMMENT 'Street name',
  `county` text NOT NULL COMMENT 'County name'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `streets`
--

INSERT INTO `streets` (`id`, `name`, `county`) VALUES
(1, 'Abattoir Avenue', 'Los Santos County'),
(2, 'Abe Milton Parkway', 'Los Santos County'),
(3, 'Ace Jones Drive', 'Los Santos County'),
(4, 'Adam\'s Apple Boulevard', 'Los Santos County'),
(5, 'Aguja Street', 'Los Santos County'),
(6, 'Alta Place', 'Los Santos County'),
(7, 'Alta Street', 'Los Santos County'),
(8, 'Amarillo Vista', 'Los Santos County'),
(9, 'Amarillo Way', 'Los Santos County'),
(10, 'Americano Way', 'Los Santos County'),
(11, 'Atlee Street', 'Los Santos County'),
(12, 'Autopia Parkway', 'Los Santos County'),
(13, 'Banham Canyon Drive', 'Los Santos County'),
(14, 'Barbareno Road', 'Los Santos County'),
(15, 'Bay City Avenue', 'Los Santos County'),
(16, 'Bay City Incline', 'Los Santos County'),
(17, 'Baytree Canyon Road (City)', 'Los Santos County'),
(18, 'Boulevard Del Perro', 'Los Santos County'),
(19, 'Bridge Street', 'Los Santos County'),
(20, 'Brouge Avenue', 'Los Santos County'),
(21, 'Buccaneer Way', 'Los Santos County'),
(22, 'Buen Vino Road', 'Los Santos County'),
(23, 'Caesars Place', 'Los Santos County'),
(24, 'Calais Avenue', 'Los Santos County'),
(25, 'Capital Boulevard', 'Los Santos County'),
(26, 'Carcer Way', 'Los Santos County'),
(27, 'Carson Avenue', 'Los Santos County'),
(28, 'Chum Street', 'Los Santos County'),
(29, 'Chupacabra Street', 'Los Santos County'),
(30, 'Clinton Avenue', 'Los Santos County'),
(31, 'Cockingend Drive', 'Los Santos County'),
(32, 'Conquistador Street', 'Los Santos County'),
(33, 'Cortes Street', 'Los Santos County'),
(34, 'Cougar Avenue', 'Los Santos County'),
(35, 'Covenant Avenue', 'Los Santos County'),
(36, 'Cox Way', 'Los Santos County'),
(37, 'Crusade Road', 'Los Santos County'),
(38, 'Davis Avenue', 'Los Santos County'),
(39, 'Decker Street', 'Los Santos County'),
(40, 'Didion Drive', 'Los Santos County'),
(41, 'Dorset Drive', 'Los Santos County'),
(42, 'Dorset Place', 'Los Santos County'),
(43, 'Dry Dock Street', 'Los Santos County'),
(44, 'Dunstable Drive', 'Los Santos County'),
(45, 'Dunstable Lane', 'Los Santos County'),
(46, 'Dutch London Street', 'Los Santos County'),
(47, 'Eastbourne Way', 'Los Santos County'),
(48, 'East Galileo Avenue', 'Los Santos County'),
(49, 'East Mirror Drive', 'Los Santos County'),
(50, 'Eclipse Boulevard', 'Los Santos County'),
(51, 'Edwood Way', 'Los Santos County'),
(52, 'Elgin Avenue', 'Los Santos County'),
(53, 'El Burro Boulevard', 'Los Santos County'),
(54, 'El Rancho Boulevard', 'Los Santos County'),
(55, 'Equality Way', 'Los Santos County'),
(56, 'Exceptionalists Way', 'Los Santos County'),
(57, 'Fantastic Place', 'Los Santos County'),
(58, 'Fenwell Place', 'Los Santos County'),
(59, 'Forum Drive', 'Los Santos County'),
(60, 'Fudge Lane', 'Los Santos County'),
(61, 'Galileo Road', 'Los Santos County'),
(62, 'Gentry Lane', 'Los Santos County'),
(63, 'Ginger Street', 'Los Santos County'),
(64, 'Glory Way', 'Los Santos County'),
(65, 'Goma Street', 'Los Santos County'),
(66, 'Greenwich Parkway', 'Los Santos County'),
(67, 'Greenwich Place', 'Los Santos County'),
(68, 'Greenwich Way', 'Los Santos County'),
(69, 'Grove Street', 'Los Santos County'),
(70, 'Hanger Way', 'Los Santos County'),
(71, 'Hangman Avenue', 'Los Santos County'),
(72, 'Hardy Way', 'Los Santos County'),
(73, 'Hawick Avenue', 'Los Santos County'),
(74, 'Heritage Way', 'Los Santos County'),
(75, 'Hillcrest Avenue', 'Los Santos County'),
(76, 'Hillcrest Ridge Access Road', 'Los Santos County'),
(77, 'Imagination Court', 'Los Santos County'),
(78, 'Industry Passage', 'Los Santos County'),
(79, 'Ineseno Road', 'Los Santos County'),
(80, 'Integrity Way', 'Los Santos County'),
(81, 'Invention Court', 'Los Santos County'),
(82, 'Innocence Boulevard', 'Los Santos County'),
(83, 'Jamestown Street', 'Los Santos County'),
(84, 'Kimble Hill Drive', 'Los Santos County'),
(85, 'Kortz Drive', 'Los Santos County'),
(86, 'Labor Place', 'Los Santos County'),
(87, 'Laguna Place', 'Los Santos County'),
(88, 'Lake Vinewood Drive', 'Los Santos County'),
(89, 'Las Lagunas Boulevard', 'Los Santos County'),
(90, 'Liberty Street', 'Los Santos County'),
(91, 'Lindsay Circus', 'Los Santos County'),
(92, 'Little Bighorn Avenue', 'Los Santos County'),
(93, 'Low Power Street', 'Los Santos County'),
(94, 'Macdonald Street', 'Los Santos County'),
(95, 'Mad Wayne Thunder Drive', 'Los Santos County'),
(96, 'Magellan Avenue', 'Los Santos County'),
(97, 'Marathon Avenue', 'Los Santos County'),
(98, 'Marlowe Drive', 'Los Santos County'),
(99, 'Melanoma Street', 'Los Santos County'),
(100, 'Meteor Street', 'Los Santos County'),
(101, 'Milton Road', 'Los Santos County'),
(102, 'Mirror Park Boulevard', 'Los Santos County'),
(103, 'Mirror Place', 'Los Santos County'),
(104, 'Morningwood Boulevard', 'Los Santos County'),
(105, 'Mount Haan Drive', 'Los Santos County'),
(106, 'Mount Haan Road', 'Los Santos County'),
(107, 'Mount Vinewood Drive', 'Los Santos County'),
(108, 'Movie Star Way', 'Los Santos County'),
(109, 'Mutiny Road', 'Los Santos County'),
(110, 'New Empire Way', 'Los Santos County'),
(111, 'Nikola Avenue', 'Los Santos County'),
(112, 'Nikola Place', 'Los Santos County'),
(113, 'Normandy Drive', 'Los Santos County'),
(114, 'North Archer Avenue', 'Los Santos County'),
(115, 'North Conker Avenue', 'Los Santos County'),
(116, 'North Sheldon Avenue', 'Los Santos County'),
(117, 'North Rockford Drive', 'Los Santos County'),
(118, 'Occupation Avenue', 'Los Santos County'),
(119, 'Orchardville Avenue', 'Los Santos County'),
(120, 'Palomino Avenue', 'Los Santos County'),
(121, 'Peaceful Street', 'Los Santos County'),
(122, 'Perth Street', 'Los Santos County'),
(123, 'Picture Perfect Drive', 'Los Santos County'),
(124, 'Plaice Place', 'Los Santos County'),
(125, 'Playa Vista', 'Los Santos County'),
(126, 'Popular Street', 'Los Santos County'),
(127, 'Portola Drive', 'Los Santos County'),
(128, 'Power Street', 'Los Santos County'),
(129, 'Prosperity Street', 'Los Santos County'),
(130, 'Prosperity Street Promenade', 'Los Santos County'),
(131, 'Red Desert Avenue', 'Los Santos County'),
(132, 'Richman Street', 'Los Santos County'),
(133, 'Rockford Drive', 'Los Santos County'),
(134, 'Roy Lowenstein Boulevard', 'Los Santos County'),
(135, 'Rub Street', 'Los Santos County'),
(136, 'Sam Austin Drive', 'Los Santos County'),
(137, 'San Andreas Avenue', 'Los Santos County'),
(138, 'Sandcastle Way', 'Los Santos County'),
(139, 'San Vitus Boulevard', 'Los Santos County'),
(140, 'Senora Road', 'Los Santos County'),
(141, 'Shank Street', 'Los Santos County'),
(142, 'Signal Street', 'Los Santos County'),
(143, 'Sinner Street', 'Los Santos County'),
(144, 'Sinners Passage', 'Los Santos County'),
(145, 'South Arsenal Street', 'Los Santos County'),
(146, 'South Boulevard Del Perro', 'Los Santos County'),
(147, 'South Mo Milton Drive', 'Los Santos County'),
(148, 'South Rockford Drive', 'Los Santos County'),
(149, 'South Shambles Street', 'Los Santos County'),
(150, 'Spanish Avenue', 'Los Santos County'),
(151, 'Steele Way', 'Los Santos County'),
(152, 'Strangeways Drive', 'Los Santos County'),
(153, 'Strawberry Avenue', 'Los Santos County'),
(154, 'Supply Street', 'Los Santos County'),
(155, 'Sustancia Road', 'Los Santos County'),
(156, 'Swiss Street', 'Los Santos County'),
(157, 'Tackle Street', 'Los Santos County'),
(158, 'Tangerine Street', 'Los Santos County'),
(159, 'Tongva Drive', 'Los Santos County'),
(160, 'Tower Way', 'Los Santos County'),
(161, 'Tug Street', 'Los Santos County'),
(162, 'Utopia Gardens', 'Los Santos County'),
(163, 'Vespucci Boulevard', 'Los Santos County'),
(164, 'Vinewood Boulevard', 'Los Santos County'),
(165, 'Vinewood Park Drive', 'Los Santos County'),
(166, 'Vitus Street', 'Los Santos County'),
(167, 'Voodoo Place', 'Los Santos County'),
(168, 'West Eclipse Boulevard', 'Los Santos County'),
(169, 'West Galileo Avenue', 'Los Santos County'),
(170, 'West Mirror Drive', 'Los Santos County'),
(171, 'Whispymound Drive', 'Los Santos County'),
(172, 'Wild Oats Drive', 'Los Santos County'),
(173, 'York Street', 'Los Santos County'),
(174, 'Zancudo Barranca', 'LOS Santos'),
(175, 'Algonquin Boulevard', 'Blaine County'),
(176, 'Alhambra Drive', 'Blaine County'),
(177, 'Armadillo Avenue', 'Blaine County'),
(178, 'Baytree Canyon Road (County)', 'Blaine County'),
(179, 'Calafia Road', 'Blaine County'),
(180, 'Cascabel Avenue', 'Blaine County'),
(181, 'Cassidy Trail', 'Blaine County'),
(182, 'Cat-Claw Avenue', 'Blaine County'),
(183, 'Chianski Passage', 'Blaine County'),
(184, 'Cholla Road', 'Blaine County'),
(185, 'Cholla Springs Avenue', 'Blaine County'),
(186, 'Duluoz Avenue', 'Blaine County'),
(187, 'East Joshua Road', 'Blaine County'),
(188, 'Fort Zancudo Approach Road', 'Blaine County'),
(189, 'Galileo Road', 'Blaine County'),
(190, 'Grapeseed Avenue', 'Blaine County'),
(191, 'Grapeseed Main Street', 'Blaine County'),
(192, 'Joad Lane', 'Blaine County'),
(193, 'Joshua Road', 'Blaine County'),
(194, 'Lesbos Lane', 'Blaine County'),
(195, 'Lolita Avenue', 'Blaine County'),
(196, 'Marina Drive', 'Blaine County'),
(197, 'Meringue Lane', 'Blaine County'),
(198, 'Mount Haan Road', 'Blaine County'),
(199, 'Mountain View Drive', 'Blaine County'),
(200, 'Niland Avenue', 'Blaine County'),
(201, 'North Calafia Way', 'Blaine County'),
(202, 'Nowhere Road', 'Blaine County'),
(203, 'O\'Neil Way', 'Blaine County'),
(204, 'Paleto Boulevard', 'Blaine County'),
(205, 'Panorama Drive', 'Blaine County'),
(206, 'Procopio Drive', 'Blaine County'),
(207, 'Procopio Promenade', 'Blaine County'),
(208, 'Pyrite Avenue', 'Blaine County'),
(209, 'Raton Pass', 'Blaine County'),
(210, 'Route 68 Approach', 'Blaine County'),
(211, 'Seaview Road', 'Blaine County'),
(212, 'Senora Way', 'Blaine County'),
(213, 'Smoke Tree Road', 'Blaine County'),
(214, 'Union Road', 'Blaine County'),
(215, 'Zancudo Avenue', 'Blaine County'),
(216, 'Zancudo Road', 'Blaine County'),
(217, 'Zancudo Trail', 'Blaine County'),
(218, 'Interstate 1', 'State'),
(219, 'Interstate 2', 'State'),
(220, 'Interstate 4', 'State'),
(221, 'Interstate 5', 'State'),
(222, 'Route 1', 'State'),
(223, 'Route 11', 'State'),
(224, 'Route 13', 'State'),
(225, 'Route 14', 'State'),
(226, 'Route 15', 'State'),
(227, 'Route 16', 'State'),
(228, 'Route 17', 'State'),
(229, 'Route 18', 'State'),
(230, 'Route 19', 'State'),
(231, 'Route 20', 'State'),
(232, 'Route 22', 'State'),
(233, 'Route 23', 'State'),
(234, 'Route 68', 'State');

-- --------------------------------------------------------

--
-- Структура таблицы `tones`
--

CREATE TABLE `tones` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `active` set('0','1') NOT NULL DEFAULT '0' COMMENT '0 = inactive, 1 = active',
  `username` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tones table. DO NOT ADD ROWS TO THIS TABLE' ROW_FORMAT=COMPACT;

--
-- Дамп данных таблицы `tones`
--

INSERT INTO `tones` (`id`, `name`, `active`, `username`) VALUES
(0, 'priority', '0', ''),
(1, 'recurring', '0', ''),
(2, 'panic', '0', '');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` text,
  `identifier` varchar(255) DEFAULT NULL,
  `admin_privilege` int(11) NOT NULL DEFAULT '0' COMMENT 'If 0 then user does not possess any administrative permissions, else if 1 then user possess Moderator privileges, else if 2 then user possess Administrator privileges.',
  `supervisor_privilege` int(11) NOT NULL DEFAULT '0' COMMENT 'If 1 then user does not possess any supervisor privileges, else 2 then user possess supervisor privileges.',
  `password_reset` int(11) NOT NULL DEFAULT '0' COMMENT '1 means password reset required. 0 means it''s not.',
  `approved` int(11) NOT NULL DEFAULT '0' COMMENT 'Three main statuses: 0 means pending approval. 1 means has access. 2 means suspended',
  `suspend_reason` tinytext COMMENT 'Stores the reason why a user is Suspended',
  `suspend_duration` date DEFAULT NULL COMMENT 'Stores the duration a user is Suspended for',
  `rp_name` varchar(255) NOT NULL DEFAULT 'None',
  `rp_rank` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `rp_agency` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `anonymous` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='User table' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `user_departments`
--

CREATE TABLE `user_departments` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `user_departments_temp`
--

CREATE TABLE `user_departments_temp` (
  `user_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Temporary table - stores user departments for non-approved users' ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Структура таблицы `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `Make` varchar(100) NOT NULL,
  `Model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `warrants`
--

CREATE TABLE `warrants` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `weapons`
--

CREATE TABLE `weapons` (
  `id` int(11) NOT NULL,
  `weapon_type` varchar(255) NOT NULL,
  `weapon_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `weapons`
--

INSERT INTO `weapons` (`id`, `weapon_type`, `weapon_name`) VALUES
(1, 'Pistols', 'Pistol'),
(2, 'Pistols', 'Combat-Pistol'),
(3, 'Pistols', 'AP-Pistol'),
(4, 'Pistols', 'Pistol-.50'),
(5, 'Shotguns', 'Sawed-off-Shotgun'),
(6, 'Sniper-Rifles', 'Sniper-Rifle'),
(7, 'Sniper-Rifles', 'Marksman-Rifle');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `active_users`
--
ALTER TABLE `active_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `identifier` (`identifier`) USING BTREE;

--
-- Индексы таблицы `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Индексы таблицы `agency_users`
--
ALTER TABLE `agency_users`
  ADD PRIMARY KEY (`newid`);

--
-- Индексы таблицы `bolos_persons`
--
ALTER TABLE `bolos_persons`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Индексы таблицы `bolos_vehicles`
--
ALTER TABLE `bolos_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`fordelete`);

--
-- Индексы таблицы `dispatchers`
--
ALTER TABLE `dispatchers`
  ADD UNIQUE KEY `identifier` (`identifier`);

--
-- Индексы таблицы `ncic_arrests`
--
ALTER TABLE `ncic_arrests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_citations`
--
ALTER TABLE `ncic_citations`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_evacuation`
--
ALTER TABLE `ncic_evacuation`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_names`
--
ALTER TABLE `ncic_names`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_plates`
--
ALTER TABLE `ncic_plates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_warnings`
--
ALTER TABLE `ncic_warnings`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_warrants`
--
ALTER TABLE `ncic_warrants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ncic_weapons`
--
ALTER TABLE `ncic_weapons`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `ranks`
--
ALTER TABLE `ranks`
  ADD PRIMARY KEY (`rank_id`);

--
-- Индексы таблицы `ranks_users`
--
ALTER TABLE `ranks_users`
  ADD PRIMARY KEY (`fordelete`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reports_dispatch`
--
ALTER TABLE `reports_dispatch`
  ADD PRIMARY KEY (`fordelete`);

--
-- Индексы таблицы `reports_units`
--
ALTER TABLE `reports_units`
  ADD PRIMARY KEY (`fordelete`);

--
-- Индексы таблицы `streets`
--
ALTER TABLE `streets`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `warrants`
--
ALTER TABLE `warrants`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `weapons`
--
ALTER TABLE `weapons`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `agency_users`
--
ALTER TABLE `agency_users`
  MODIFY `newid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bolos_persons`
--
ALTER TABLE `bolos_persons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT для таблицы `bolos_vehicles`
--
ALTER TABLE `bolos_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT для таблицы `chat`
--
ALTER TABLE `chat`
  MODIFY `fordelete` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ncic_arrests`
--
ALTER TABLE `ncic_arrests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `ncic_citations`
--
ALTER TABLE `ncic_citations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `ncic_evacuation`
--
ALTER TABLE `ncic_evacuation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `ncic_names`
--
ALTER TABLE `ncic_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ncic_plates`
--
ALTER TABLE `ncic_plates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `ncic_warnings`
--
ALTER TABLE `ncic_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `ncic_warrants`
--
ALTER TABLE `ncic_warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `ncic_weapons`
--
ALTER TABLE `ncic_weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `ranks`
--
ALTER TABLE `ranks`
  MODIFY `rank_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `ranks_users`
--
ALTER TABLE `ranks_users`
  MODIFY `fordelete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `reports_dispatch`
--
ALTER TABLE `reports_dispatch`
  MODIFY `fordelete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `reports_units`
--
ALTER TABLE `reports_units`
  MODIFY `fordelete` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `streets`
--
ALTER TABLE `streets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key for each street', AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `warrants`
--
ALTER TABLE `warrants`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `weapons`
--
ALTER TABLE `weapons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
