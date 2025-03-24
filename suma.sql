-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 24, 2025 at 01:04 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `suma`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'bca305', 'admin123');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reply` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `name`, `mobile`, `email`, `message`, `created_at`, `reply`) VALUES
(11, 'vinith', '9500818276', 'ckvinith786@gmail.com', 'add more packages\r\n', '2025-03-24 10:16:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblbookings`
--

CREATE TABLE `tblbookings` (
  `BookingId` int(11) NOT NULL,
  `PackageId` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `NumPersons` int(11) NOT NULL CHECK (`NumPersons` >= 10),
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `TourType` enum('Family','School','College','Office','Others') NOT NULL,
  `PaymentStatus` enum('Pending','Paid') DEFAULT 'Pending',
  `BookingDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblbookings`
--

INSERT INTO `tblbookings` (`BookingId`, `PackageId`, `Name`, `Email`, `Mobile`, `NumPersons`, `StartDate`, `EndDate`, `TourType`, `PaymentStatus`, `BookingDate`) VALUES
(20, 10, 'leela', 'leela505@gmail.com', '7123478900', 13, '2025-03-13', '2025-03-16', 'Family', 'Pending', '2025-03-13 17:25:07'),
(21, 9, 'jaya', 'jaya123@gmail.com', '9500818276', 90, '2025-03-25', '2025-03-25', 'Family', 'Pending', '2025-03-24 09:10:36'),
(22, 10, 'vinith', 'ckvinith786@gmail.com', '9500818276', 56, '2025-03-26', '2025-03-21', 'Family', 'Pending', '2025-03-24 09:27:20'),
(23, 14, 'vinith', 'leelaleela3622@gmail.com', '9500818275', 67, '2025-03-28', '2025-03-29', 'Family', 'Pending', '2025-03-24 09:57:07'),
(24, 9, 'priya', 'priya@gmail.com', '7010234566', 12, '2025-03-25', '2025-03-28', 'School', 'Pending', '2025-03-24 11:11:26'),
(25, 9, 'jaya', 'jaya123@gmail.com', '9500818275', 14, '2025-03-24', '2025-03-27', 'Family', 'Pending', '2025-03-24 11:17:10');

-- --------------------------------------------------------

--
-- Table structure for table `tblinvoices`
--

CREATE TABLE `tblinvoices` (
  `InvoiceId` int(11) NOT NULL,
  `BookingId` int(11) NOT NULL,
  `CustomerName` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `PackageName` varchar(255) NOT NULL,
  `PackageLocation` varchar(255) NOT NULL,
  `NumPersons` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `TourType` varchar(100) NOT NULL,
  `BasePrice` decimal(10,2) NOT NULL,
  `DiscountPercentage` decimal(5,2) DEFAULT NULL,
  `DiscountAmount` decimal(10,2) DEFAULT NULL,
  `FinalAmount` decimal(10,2) DEFAULT NULL,
  `CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `Status` enum('approved','disapproved') DEFAULT 'disapproved'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tblinvoices`
--

INSERT INTO `tblinvoices` (`InvoiceId`, `BookingId`, `CustomerName`, `Email`, `Mobile`, `PackageName`, `PackageLocation`, `NumPersons`, `StartDate`, `EndDate`, `TourType`, `BasePrice`, `DiscountPercentage`, `DiscountAmount`, `FinalAmount`, `CreatedAt`, `Status`) VALUES
(51, 20, 'leela', 'leela505@gmail.com', '7123478900', 'Kodaikanal', 'Kodaikanal , Tamilnadu', 13, '2025-03-13', '2025-03-16', 'Family', 80.00, 1.00, 10.40, 1029.60, '2025-03-13 17:25:07', 'disapproved'),
(52, 21, 'jaya', 'jaya123@gmail.com', '9500818276', 'Kanyakumari', 'Kanyakumari, Tamilnadu', 90, '2025-03-25', '2025-03-25', 'Family', 100.00, 32.00, 2880.00, 6120.00, '2025-03-24 09:10:37', 'disapproved'),
(53, 22, 'vinith', 'ckvinith786@gmail.com', '9500818276', 'Kodaikanal', 'Kodaikanal , Tamilnadu', 56, '2025-03-26', '2025-03-21', 'Family', 100.00, 18.00, 1008.00, 4592.00, '2025-03-24 09:27:20', 'disapproved'),
(54, 22, 'vinith', 'ckvinith786@gmail.com', '9500818276', 'Kodaikanal', 'Kodaikanal , Tamilnadu', 56, '2025-03-26', '2025-03-21', 'Family', 100.00, 18.00, 1008.00, 4592.00, '2025-03-24 09:34:16', 'disapproved'),
(55, 22, 'vinith', 'ckvinith786@gmail.com', '9500818276', 'Kodaikanal', 'Kodaikanal , Tamilnadu', 56, '2025-03-26', '2025-03-21', 'Family', 100.00, 18.00, 1008.00, 4592.00, '2025-03-24 09:42:45', 'disapproved'),
(56, 23, 'vinith', 'leelaleela3622@gmail.com', '9500818275', 'Madurai', 'Madurai,Tamil Nadu', 67, '2025-03-28', '2025-03-29', 'Family', 80.00, 22.00, 1179.20, 4180.80, '2025-03-24 09:57:07', 'disapproved'),
(57, 24, 'priya', 'priya@gmail.com', '7010234566', 'Kanyakumari', 'Kanyakumari, Tamilnadu', 12, '2025-03-25', '2025-03-28', 'School', 100.00, 0.00, 0.00, 1200.00, '2025-03-24 11:11:26', 'disapproved'),
(58, 25, 'jaya', 'jaya123@gmail.com', '9500818275', 'Kanyakumari', 'Kanyakumari, Tamilnadu', 14, '2025-03-24', '2025-03-27', 'Family', 100.00, 0.00, 0.00, 1400.00, '2025-03-24 11:17:10', 'disapproved'),
(59, 25, 'jaya', 'jaya123@gmail.com', '9500818275', 'Kanyakumari', 'Kanyakumari, Tamilnadu', 14, '2025-03-24', '2025-03-27', 'Family', 100.00, 0.00, 0.00, 1400.00, '2025-03-24 11:32:54', 'disapproved');

-- --------------------------------------------------------

--
-- Table structure for table `tbltourpackages`
--

CREATE TABLE `tbltourpackages` (
  `PackageId` int(11) NOT NULL,
  `PackageName` varchar(255) NOT NULL,
  `PackageType` varchar(255) NOT NULL,
  `PackageLocation` varchar(255) NOT NULL,
  `PackageFetures` text NOT NULL,
  `PackagePrice` decimal(10,2) NOT NULL,
  `PackageImage` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `tbltourpackages`
--

INSERT INTO `tbltourpackages` (`PackageId`, `PackageName`, `PackageType`, `PackageLocation`, `PackageFetures`, `PackagePrice`, `PackageImage`) VALUES
(9, 'Kanyakumari', 'Costal exploration', 'Kanyakumari, Tamilnadu', 'Where the three oceans meet, offering a unique experience.', 1000.00, 'kanyakumari.jpg'),
(10, 'Kodaikanal', 'Hills Station', 'Kodaikanal , Tamilnadu', 'Scenic hill station with a pleasant climate', 1000.00, 'kodaikanal.jpg'),
(11, 'Thanjavur', 'Temples', 'Thanjavur,Tamil Nadu', 'History, temples, and culture. \r\n', 1000.00, 'THANJAVUR.jpg'),
(13, 'Yercaud', 'Hills and Mountains', 'Yercaud,Tamilnadu', ' A lesser-known hill station in the Eastern Ghats', 900.00, 'yercaud.jpg'),
(14, 'Madurai', 'Iconic temples and historical sites. ', 'Madurai,Tamil Nadu', 'Iconic temples and historical sites. ', 800.00, 'madurai2.jpg'),
(15, 'Ooty', 'Hills Station', 'Ooty,Tamilnadu', ' Stunning natural beauty, including mountains, lakes, gardens, and forests. ', 1000.00, 'ooty.jpg'),
(17, 'chennai', 'chennai', 'chennai, Tamilnadu', 'Malls and Parks , Metro , Beaches.', 1500.00, 'chennai.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`) VALUES
(1, 'leela', 'leela505@gmail.com', '9500818270'),
(2, 'leela', 'leela505@gmail.com', '9500818270'),
(3, 'leela', 'leela505@gmail.com', '9500818278'),
(4, 'leela', 'leela505@gmail.com', '9500848279'),
(5, 'jaya', 'ckvinith786@gmail.com', '9500848277'),
(6, 'leela', 'leela505@gmail.com', '9500817270'),
(7, 'leela', 'leela505@gmail.com', '9500818278'),
(8, 'leela', 'leela505@gmail.com', '9500818270'),
(9, 'jaya', 'leela505@gmail.com', '9500818270'),
(10, 'jaya', 'leel505@gmail.com', '9500818270'),
(11, 'jaya', 'leel50@gmail.com', '9500818270'),
(12, 'jaya', 'leel50@gmail.com', '9500818'),
(13, 'usha', 'usha@mail.com', '9500817276'),
(14, 'usha', 'usha@mail.com', '9500817276'),
(15, 'usha', 'usha@mailcom', '9500817276'),
(16, 'usha', 'usha@mail', '9500817276'),
(17, 'leela', 'leela505@gmail.com', '9500817276'),
(18, 'leela', 'leela505@gmail.com', '9500818278'),
(19, 'leela', 'leela505@gmail.com', '9500818277'),
(20, 'leela', 'leela505@gmail.com', '9500818278'),
(21, 'leela', 'leela505@gmail.com', '9500818278'),
(22, 'leela', 'leela505@gmail.com', '9500818278'),
(23, 'leela', 'leela5051@gmail.com', '9500817270'),
(24, 'leela', 'leela5005@gmail.com', '9504817276'),
(25, 'leela', 'leela505@gmail.com', '9500848277'),
(26, 'leela', 'leela515@gmail.com', '9100817276');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbookings`
--
ALTER TABLE `tblbookings`
  ADD PRIMARY KEY (`BookingId`),
  ADD KEY `PackageId` (`PackageId`);

--
-- Indexes for table `tblinvoices`
--
ALTER TABLE `tblinvoices`
  ADD PRIMARY KEY (`InvoiceId`),
  ADD KEY `BookingId` (`BookingId`);

--
-- Indexes for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  ADD PRIMARY KEY (`PackageId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tblbookings`
--
ALTER TABLE `tblbookings`
  MODIFY `BookingId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tblinvoices`
--
ALTER TABLE `tblinvoices`
  MODIFY `InvoiceId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `tbltourpackages`
--
ALTER TABLE `tbltourpackages`
  MODIFY `PackageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tblbookings`
--
ALTER TABLE `tblbookings`
  ADD CONSTRAINT `tblbookings_ibfk_1` FOREIGN KEY (`PackageId`) REFERENCES `tbltourpackages` (`PackageId`) ON DELETE CASCADE;

--
-- Constraints for table `tblinvoices`
--
ALTER TABLE `tblinvoices`
  ADD CONSTRAINT `tblinvoices_ibfk_1` FOREIGN KEY (`BookingId`) REFERENCES `tblbookings` (`BookingId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
