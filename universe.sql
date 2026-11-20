--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50),
    distance_from_earth_ly numeric,
    age integer,
    is_spherical boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_character_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_character_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_character_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter_km integer,
    orbit_duration numeric,
    planet_id integer,
    is_spherical boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_character_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_character_id_seq OWNER TO freecodecamp;

--
-- Name: moon_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_character_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(50),
    distance_from_star_au numeric,
    star_id integer,
    has_life boolean,
    is_spherical boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_character_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_character_id_seq OWNER TO freecodecamp;

--
-- Name: planet_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_character_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    star_type character varying(50),
    distance_from_earth_ly numeric,
    age integer,
    is_spherical boolean,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_character_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_character_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_character_id_seq OWNER TO freecodecamp;

--
-- Name: star_character_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_character_id_seq OWNED BY public.star.star_id;


--
-- Name: systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.systems (
    systems_id integer NOT NULL,
    name character varying(50) NOT NULL,
    system_percentage integer,
    needs_terraforming boolean
);


ALTER TABLE public.systems OWNER TO freecodecamp;

--
-- Name: systems_number_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.systems_number_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.systems_number_id_seq OWNER TO freecodecamp;

--
-- Name: systems_number_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.systems_number_id_seq OWNED BY public.systems.systems_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_character_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_character_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_character_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_character_id_seq'::regclass);


--
-- Name: systems systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems ALTER COLUMN systems_id SET DEFAULT nextval('public.systems_number_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Barred Spiral', 0.00, 13610, NULL, 'Home galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Barred Spiral', 2.54, 10010, NULL, 'Nearest major galaxy to the Milky Way.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.73, 12000, NULL, 'Third-largest member of the Local Group.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Lenticular', 29.35, 13250, NULL, 'Notable for its bright nucleus and prominent dust lane.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 23.16, 400, NULL, 'Interacting grand-design spiral galaxy in Canes Venatici.');
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 53.49, 13240, NULL, 'Supergiant elliptical galaxy housing a supermassive black hole.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, 27.32, 3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 22, 0.32, 4, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 12, 1.26, 4, false);
INSERT INTO public.moon VALUES (4, 'Io', 3643, 1.77, 5, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3121, 3.55, 5, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268, 7.15, 5, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820, 16.69, 5, true);
INSERT INTO public.moon VALUES (8, 'Titan', 5149, 15.95, 6, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 504, 1.37, 6, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 396, 0.94, 6, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 1527, 4.52, 6, true);
INSERT INTO public.moon VALUES (12, 'Titania', 1577, 8.71, 7, true);
INSERT INTO public.moon VALUES (13, 'Oberon', 1522, 13.46, 7, true);
INSERT INTO public.moon VALUES (14, 'Triton', 2706, 5.88, 8, true);
INSERT INTO public.moon VALUES (15, 'Proteus', 420, 1.12, 8, false);
INSERT INTO public.moon VALUES (16, 'Amalthea', 167, 0.50, 5, false);
INSERT INTO public.moon VALUES (17, 'Dione', 1123, 2.74, 6, true);
INSERT INTO public.moon VALUES (18, 'Tethys', 1062, 1.89, 6, true);
INSERT INTO public.moon VALUES (19, 'Iapetus', 1469, 79.32, 6, true);
INSERT INTO public.moon VALUES (20, 'Hyperion', 270, 21.28, 6, false);
INSERT INTO public.moon VALUES (21, 'Phoebe', 213, 550.56, 6, false);
INSERT INTO public.moon VALUES (22, 'Ariel', 1158, 2.52, 7, true);
INSERT INTO public.moon VALUES (23, 'Umbriel', 1169, 4.14, 7, true);
INSERT INTO public.moon VALUES (24, 'Miranda', 472, 1.41, 7, true);
INSERT INTO public.moon VALUES (25, 'Nereid', 340, 360.13, 8, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 0.39, 1, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 0.72, 1, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 1.00, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 1.52, 1, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 5.20, 1, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 9.58, 1, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 19.20, 1, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 30.05, 1, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 'Super-Earth', 0.05, 2, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 'Sub-Earth', 0.03, 2, false, true);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 'Terrestrial', 0.43, 5, false, true);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Terrestrial', 0.03, 6, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 0.000016, 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Red Dwarf', 4.24, 4850, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type main-sequence', 8.60, 242, true, 1);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 'Red Supergiant', 548.00, 10, true, 1);
INSERT INTO public.star VALUES (5, 'Kepler-186', 'Red Dwarf', 582.00, 4000, true, 1);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 'Ultra-cool Red Dwarf', 40.66, 7600, true, 1);


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.systems VALUES (1, 'Solar System (Earth)', 100, false);
INSERT INTO public.systems VALUES (2, 'Proxima Centauri System', 87, true);
INSERT INTO public.systems VALUES (3, 'TRAPPIST-1 System', 85, true);
INSERT INTO public.systems VALUES (4, 'Kepler-442 System', 84, true);
INSERT INTO public.systems VALUES (5, 'TOI-700 System', 81, true);
INSERT INTO public.systems VALUES (6, 'Kepler-186 System', 64, true);
INSERT INTO public.systems VALUES (7, 'Kepler-452 System', 61, true);
INSERT INTO public.systems VALUES (8, 'Gliese 667 C System', 58, true);
INSERT INTO public.systems VALUES (9, 'Jovian System (Europa)', 42, true);
INSERT INTO public.systems VALUES (10, 'Saturnian System (Enceladus)', 38, true);


--
-- Name: galaxy_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_character_id_seq', 6, true);


--
-- Name: moon_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_character_id_seq', 25, true);


--
-- Name: planet_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_character_id_seq', 12, true);


--
-- Name: star_character_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_character_id_seq', 6, true);


--
-- Name: systems_number_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.systems_number_id_seq', 10, true);


--
-- Name: galaxy galaxy_character_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_character_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_character_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_character_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_character_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_character_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_character_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_character_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: systems systems_number_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_number_id_key UNIQUE (systems_id);


--
-- Name: systems systems_number_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_number_id_key1 UNIQUE (systems_id);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (systems_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

