-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2018 at 04:50 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_david_huml_carrental`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `car_id` int(10) UNSIGNED NOT NULL,
  `manufacturer` varchar(35) DEFAULT NULL,
  `model` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`car_id`, `manufacturer`, `model`) VALUES
(1, 'Tesla', 'Model 3'),
(2, 'BMW', 'X5'),
(3, 'BMW', 'X5'),
(4, 'Tesla', 'Model 3'),
(5, 'Audi ', 'A8');

-- --------------------------------------------------------

--
-- Table structure for table `car_return`
--

CREATE TABLE `car_return` (
  `return_id` int(10) UNSIGNED NOT NULL,
  `fk_rent_id` int(10) UNSIGNED DEFAULT NULL,
  `damage_charge` float DEFAULT NULL,
  `gas_level_charge` float DEFAULT NULL,
  `fk_tracking_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_return`
--

INSERT INTO `car_return` (`return_id`, `fk_rent_id`, `damage_charge`, `gas_level_charge`, `fk_tracking_id`) VALUES
(4, 2, 250, 10, 8);

-- --------------------------------------------------------

--
-- Table structure for table `car_tracking`
--

CREATE TABLE `car_tracking` (
  `tracking_id` int(10) UNSIGNED NOT NULL,
  `fk_location_id` int(10) UNSIGNED DEFAULT NULL,
  `tracking_date` date DEFAULT NULL,
  `fk_car_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `car_tracking`
--

INSERT INTO `car_tracking` (`tracking_id`, `fk_location_id`, `tracking_date`, `fk_car_id`) VALUES
(3, 1, '2018-02-01', 1),
(4, 1, '2018-02-01', 2),
(5, 1, '2018-02-01', 3),
(6, 1, '2018-02-01', 4),
(7, 1, '2018-02-01', 5),
(8, 5, '2018-02-21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `driver`
--

CREATE TABLE `driver` (
  `driver_id` int(10) UNSIGNED NOT NULL,
  `driver_first_name` varchar(25) DEFAULT NULL,
  `driver_last_name` varchar(50) DEFAULT NULL,
  `dirver_birthdate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `driver`
--

INSERT INTO `driver` (`driver_id`, `driver_first_name`, `driver_last_name`, `dirver_birthdate`) VALUES
(1, 'John', 'Doe', '1990-02-07'),
(2, 'Hans', 'Wurst', '1975-12-27'),
(3, 'carina', 'lucia', '1985-07-20'),
(4, 'Johanna', 'Karoline', '1989-09-07'),
(5, 'max', 'muster', '1968-02-15');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` int(10) UNSIGNED NOT NULL,
  `city_name` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `city_name`) VALUES
(1, 'Vienna'),
(2, 'Salzburg'),
(3, 'Graz'),
(4, 'Linz'),
(5, 'St. Pölten');

-- --------------------------------------------------------

--
-- Table structure for table `rent`
--

CREATE TABLE `rent` (
  `rent_id` int(10) UNSIGNED NOT NULL,
  `paid_charges` float DEFAULT NULL,
  `fk_res_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rent`
--

INSERT INTO `rent` (`rent_id`, `paid_charges`, `fk_res_id`) VALUES
(2, 300, 1),
(4, 300, 3),
(5, 300, 4);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `res_id` int(10) UNSIGNED NOT NULL,
  `fk_driver_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_car_id` int(10) UNSIGNED DEFAULT NULL,
  `res_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`res_id`, `fk_driver_id`, `fk_car_id`, `res_date`) VALUES
(1, 4, 1, '2018-02-04'),
(2, 3, 5, '2018-02-25'),
(3, 2, 4, '2018-03-12'),
(4, 1, 1, '2018-02-14');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `car_return`
--
ALTER TABLE `car_return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_rent_id` (`fk_rent_id`),
  ADD KEY `fk_tracking_id` (`fk_tracking_id`);

--
-- Indexes for table `car_tracking`
--
ALTER TABLE `car_tracking`
  ADD PRIMARY KEY (`tracking_id`),
  ADD KEY `fk_location_id` (`fk_location_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- Indexes for table `driver`
--
ALTER TABLE `driver`
  ADD PRIMARY KEY (`driver_id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `rent`
--
ALTER TABLE `rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `fk_res_id` (`fk_res_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`res_id`),
  ADD KEY `fk_driver_id` (`fk_driver_id`),
  ADD KEY `fk_car_id` (`fk_car_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `car_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `car_return`
--
ALTER TABLE `car_return`
  MODIFY `return_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `car_tracking`
--
ALTER TABLE `car_tracking`
  MODIFY `tracking_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `driver`
--
ALTER TABLE `driver`
  MODIFY `driver_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `rent`
--
ALTER TABLE `rent`
  MODIFY `rent_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `res_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `car_return`
--
ALTER TABLE `car_return`
  ADD CONSTRAINT `car_return_ibfk_1` FOREIGN KEY (`fk_rent_id`) REFERENCES `rent` (`rent_id`),
  ADD CONSTRAINT `car_return_ibfk_2` FOREIGN KEY (`fk_tracking_id`) REFERENCES `car_tracking` (`tracking_id`);

--
-- Constraints for table `car_tracking`
--
ALTER TABLE `car_tracking`
  ADD CONSTRAINT `car_tracking_ibfk_1` FOREIGN KEY (`fk_location_id`) REFERENCES `location` (`location_id`),
  ADD CONSTRAINT `car_tracking_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);

--
-- Constraints for table `rent`
--
ALTER TABLE `rent`
  ADD CONSTRAINT `rent_ibfk_1` FOREIGN KEY (`fk_res_id`) REFERENCES `reservation` (`res_id`);

--
-- Constraints for table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_driver_id`) REFERENCES `driver` (`driver_id`),
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_car_id`) REFERENCES `cars` (`car_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
