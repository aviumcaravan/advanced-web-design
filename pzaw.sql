-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 04 Lis 2021, 17:32
-- Wersja serwera: 10.4.21-MariaDB
-- Wersja PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `pzaw`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `album`
--

CREATE TABLE `album` (
  `id_alb` int(11) NOT NULL,
  `nazwa_alb` text NOT NULL,
  `id_uzy` int(11) NOT NULL,
  `id_gal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `galeria`
--

CREATE TABLE `galeria` (
  `id_gal` int(11) NOT NULL,
  `nazwa_gal` text NOT NULL,
  `id_uzy` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `id_kom` int(11) NOT NULL,
  `text_kom` text NOT NULL,
  `id_uzy` int(11) NOT NULL,
  `id_zdj` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uzytkownik`
--

CREATE TABLE `uzytkownik` (
  `id_uzy` int(11) NOT NULL,
  `nazwa_uzy` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecia`
--

CREATE TABLE `zdjecia` (
  `id_zdj` int(11) NOT NULL,
  `link_zdj` text NOT NULL,
  `text_alt` text NOT NULL,
  `id_uzy` int(11) NOT NULL,
  `id_alb` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_alb`),
  ADD KEY `id_alb` (`id_alb`),
  ADD KEY `id_uzy` (`id_uzy`),
  ADD KEY `id_gal` (`id_gal`);

--
-- Indeksy dla tabeli `galeria`
--
ALTER TABLE `galeria`
  ADD PRIMARY KEY (`id_gal`),
  ADD KEY `id_gal` (`id_gal`),
  ADD KEY `id_uzy` (`id_uzy`);

--
-- Indeksy dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`id_kom`),
  ADD KEY `id_kom` (`id_kom`,`id_uzy`,`id_zdj`),
  ADD KEY `id_zdj` (`id_zdj`),
  ADD KEY `id_uzy` (`id_uzy`);

--
-- Indeksy dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  ADD PRIMARY KEY (`id_uzy`),
  ADD KEY `id_uzy` (`id_uzy`);

--
-- Indeksy dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD PRIMARY KEY (`id_zdj`),
  ADD KEY `id_zdj` (`id_zdj`,`id_uzy`,`id_alb`),
  ADD KEY `id_uzy` (`id_uzy`),
  ADD KEY `id_alb` (`id_alb`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `album`
--
ALTER TABLE `album`
  MODIFY `id_alb` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `galeria`
--
ALTER TABLE `galeria`
  MODIFY `id_gal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `id_kom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `uzytkownik`
--
ALTER TABLE `uzytkownik`
  MODIFY `id_uzy` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  MODIFY `id_zdj` int(11) NOT NULL AUTO_INCREMENT;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `album`
--
ALTER TABLE `album`
  ADD CONSTRAINT `album_ibfk_1` FOREIGN KEY (`id_uzy`) REFERENCES `uzytkownik` (`id_uzy`),
  ADD CONSTRAINT `album_ibfk_2` FOREIGN KEY (`id_gal`) REFERENCES `galeria` (`id_gal`);

--
-- Ograniczenia dla tabeli `galeria`
--
ALTER TABLE `galeria`
  ADD CONSTRAINT `galeria_ibfk_1` FOREIGN KEY (`id_uzy`) REFERENCES `uzytkownik` (`id_uzy`);

--
-- Ograniczenia dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  ADD CONSTRAINT `komentarze_ibfk_1` FOREIGN KEY (`id_zdj`) REFERENCES `zdjecia` (`id_zdj`),
  ADD CONSTRAINT `komentarze_ibfk_2` FOREIGN KEY (`id_uzy`) REFERENCES `uzytkownik` (`id_uzy`);

--
-- Ograniczenia dla tabeli `zdjecia`
--
ALTER TABLE `zdjecia`
  ADD CONSTRAINT `zdjecia_ibfk_1` FOREIGN KEY (`id_uzy`) REFERENCES `uzytkownik` (`id_uzy`),
  ADD CONSTRAINT `zdjecia_ibfk_2` FOREIGN KEY (`id_alb`) REFERENCES `album` (`id_alb`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
