--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    galaxy_type character varying(30),
    distance_from_earth_in_ly integer,
    age_in_millions_of_years integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    is_spherical boolean,
    distance_to_host_planet_in_km integer,
    planet_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: more_planet_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.more_planet_info (
    orbital_period_in_days numeric,
    description text,
    more_planet_info_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.more_planet_info OWNER TO freecodecamp;

--
-- Name: more_planet_info_more_planet_info_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.more_planet_info_more_planet_info_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.more_planet_info_more_planet_info_id_seq OWNER TO freecodecamp;

--
-- Name: more_planet_info_more_planet_info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.more_planet_info_more_planet_info_id_seq OWNED BY public.more_planet_info.more_planet_info_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    planet_type character varying(30),
    has_life boolean,
    color character varying(30),
    radius_in_km integer,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    star_type character varying(30),
    galaxy_id integer,
    name character varying(30) NOT NULL,
    radius_in_km numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: more_planet_info more_planet_info_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info ALTER COLUMN more_planet_info_id SET DEFAULT nextval('public.more_planet_info_more_planet_info_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'SBbc', NULL, 13610, 'Milky way');
INSERT INTO public.galaxy VALUES (2, 'dSph', 3, 10101, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 'dSph', 25640, 13600, 'Sagittarius');
INSERT INTO public.galaxy VALUES (4, 'E2', 2650000, 10101, 'M32');
INSERT INTO public.galaxy VALUES (5, 'dSph', 98, 1000, 'Lacerta');
INSERT INTO public.galaxy VALUES (6, 'dSph', 75020, 12000, 'Segue 1');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, true, 384400, NULL, 'moon');
INSERT INTO public.moon VALUES (2, true, 127960, NULL, 'metis');
INSERT INTO public.moon VALUES (3, true, 128980, NULL, 'adrastea');
INSERT INTO public.moon VALUES (4, true, 221900, NULL, 'thebe');
INSERT INTO public.moon VALUES (5, true, 670900, NULL, 'europa');
INSERT INTO public.moon VALUES (6, true, 1883000, NULL, 'callisto');
INSERT INTO public.moon VALUES (7, true, 11094000, NULL, 'leda');
INSERT INTO public.moon VALUES (8, true, 185520, NULL, 'mimas');
INSERT INTO public.moon VALUES (9, true, 238020, NULL, 'enceladus');
INSERT INTO public.moon VALUES (10, true, 294660, NULL, 'tethys');
INSERT INTO public.moon VALUES (11, true, 377400, NULL, 'dione');
INSERT INTO public.moon VALUES (12, true, 527040, NULL, 'rhea');
INSERT INTO public.moon VALUES (13, true, 1221850, NULL, 'titan');
INSERT INTO public.moon VALUES (14, true, 3561300, NULL, 'lapetus');
INSERT INTO public.moon VALUES (15, true, 4181000, NULL, 'hyperion');
INSERT INTO public.moon VALUES (16, false, 9380, NULL, 'phobos');
INSERT INTO public.moon VALUES (17, false, 23460, NULL, 'deimos');
INSERT INTO public.moon VALUES (18, true, 421600, NULL, 'io');
INSERT INTO public.moon VALUES (19, true, 11737000, NULL, 'elara');
INSERT INTO public.moon VALUES (20, true, 22600000, NULL, 'carme');


--
-- Data for Name: more_planet_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.more_planet_info VALUES (59, 'closest planet to the sun', 1, 'Mercury');
INSERT INTO public.more_planet_info VALUES (225, 'hottest in the sun system', 2, 'Venus');
INSERT INTO public.more_planet_info VALUES (365, 'habitable planet known so far', 3, 'Earth');
INSERT INTO public.more_planet_info VALUES (687, 'red planet most similar to earth', 4, 'Mars');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (3, 'Rocky', true, 'blue', 6371, NULL, 'Earth');
INSERT INTO public.planet VALUES (4, 'Rocky', false, 'red', 3389, NULL, 'Mars');
INSERT INTO public.planet VALUES (5, 'Gas giant', false, 'brown', 69911, NULL, 'Jupiter');
INSERT INTO public.planet VALUES (6, 'Gas giant', false, 'orange-red', 58232, NULL, 'Saturn');
INSERT INTO public.planet VALUES (2, 'Rocky', false, 'light-gray', 6052, NULL, 'Venus');
INSERT INTO public.planet VALUES (1, 'Rocky', false, 'gray', 2439, NULL, 'Mercury');
INSERT INTO public.planet VALUES (7, 'Gas giant', false, 'light-blue', 25559, NULL, 'Uranus');
INSERT INTO public.planet VALUES (8, 'Gas giant', false, 'blue-green', 24764, NULL, 'Neptune');
INSERT INTO public.planet VALUES (9, 'Dwarf planet', false, NULL, 1151, NULL, 'Pluto');
INSERT INTO public.planet VALUES (10, 'Rocky', false, NULL, 8282, NULL, 'Proxima centauri b');
INSERT INTO public.planet VALUES (11, 'Rocky', false, NULL, 135830, NULL, 'Pegasi b');
INSERT INTO public.planet VALUES (12, 'Super earth', false, NULL, 11946, NULL, '55 Cancri e');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'M5.5', NULL, 'Proxima Centauri', 107280);
INSERT INTO public.star VALUES (3, 'M3.5V', NULL, 'Ross 154', 166970);
INSERT INTO public.star VALUES (4, 'M0 3', NULL, 'Mirach', 69570000);
INSERT INTO public.star VALUES (5, 'B9.5 3', NULL, 'Epsilon Sagittarii', 4193086);
INSERT INTO public.star VALUES (6, 'B-type', NULL, 'Alpheratz', 2345886);
INSERT INTO public.star VALUES (1, 'G2V', 1, 'Sun', 695700);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: more_planet_info_more_planet_info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.more_planet_info_more_planet_info_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_key UNIQUE (planet_id);


--
-- Name: more_planet_info more_planet_info_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info
    ADD CONSTRAINT more_planet_info_name_key UNIQUE (name);


--
-- Name: more_planet_info more_planet_info_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.more_planet_info
    ADD CONSTRAINT more_planet_info_pkey PRIMARY KEY (more_planet_info_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


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

