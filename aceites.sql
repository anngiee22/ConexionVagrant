-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 21-11-2022 a las 03:37:04
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aceites`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aceite`
--

DROP TABLE IF EXISTS `aceite`;
CREATE TABLE IF NOT EXISTS `aceite` (
  `idAceite` varchar(11) NOT NULL,
  `idMarca` int(3) NOT NULL,
  `idTipo` int(3) NOT NULL,
  `idUnidad` int(3) NOT NULL,
  `capacidad` int(4) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idAceite`),
  KEY `idMarca` (`idMarca`),
  KEY `idTipo` (`idTipo`),
  KEY `idUnidad` (`idUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `aceite`
--

INSERT INTO `aceite` (`idAceite`, `idMarca`, `idTipo`, `idUnidad`, `capacidad`, `descripcion`) VALUES
('02A', 1, 2, 1, 950, NULL),
('03A', 1, 1, 1, 950, NULL),
('12A', 2, 1, 2, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

DROP TABLE IF EXISTS `marca`;
CREATE TABLE IF NOT EXISTS `marca` (
  `idMarca` int(11) NOT NULL AUTO_INCREMENT,
  `nombreMarca` varchar(40) NOT NULL,
  PRIMARY KEY (`idMarca`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`idMarca`, `nombreMarca`) VALUES
(1, 'Mobil Super'),
(2, 'Castrol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo`
--

DROP TABLE IF EXISTS `tipo`;
CREATE TABLE IF NOT EXISTS `tipo` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreTipo` varchar(40) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo`
--

INSERT INTO `tipo` (`idTipo`, `nombreTipo`) VALUES
(1, 'Frenos'),
(2, 'Motor'),
(3, 'Limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `unidad`
--

DROP TABLE IF EXISTS `unidad`;
CREATE TABLE IF NOT EXISTS `unidad` (
  `idUnidad` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUnidad` varchar(40) NOT NULL,
  `abreviacionUnidad` varchar(3) NOT NULL,
  PRIMARY KEY (`idUnidad`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `unidad`
--

INSERT INTO `unidad` (`idUnidad`, `nombreUnidad`, `abreviacionUnidad`) VALUES
(1, 'Mililitros', 'mL'),
(2, 'Litros', 'L');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aceite`
--
ALTER TABLE `aceite`
  ADD CONSTRAINT `aceite_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aceite_ibfk_2` FOREIGN KEY (`idMarca`) REFERENCES `marca` (`idMarca`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `aceite_ibfk_3` FOREIGN KEY (`idUnidad`) REFERENCES `unidad` (`idUnidad`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
