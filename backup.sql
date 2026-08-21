--
-- PostgreSQL database dump
--

\restrict LDfSepd22dFUOYSurlPb3vNfdBBPQcte2swvGbvFNkJqpOjUFAb9Y0dCeygAYoa

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

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
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clientes (
    id integer NOT NULL,
    nome_cliente character varying(100) NOT NULL,
    cpf_cliente character(11) NOT NULL,
    endereco_cliente character varying(200),
    telefone_cliente character varying(20)
);


ALTER TABLE public.clientes OWNER TO postgres;

--
-- Name: TABLE clientes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.clientes IS 'Cadastro de clientes';


--
-- Name: COLUMN clientes.cpf_cliente; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.clientes.cpf_cliente IS 'CPF sem máscara';


--
-- Name: clientes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clientes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clientes_id_seq OWNER TO postgres;

--
-- Name: clientes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clientes_id_seq OWNED BY public.clientes.id;


--
-- Name: itens_venda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itens_venda (
    id_venda integer NOT NULL,
    id_produto integer NOT NULL,
    quantidade_venda_item integer NOT NULL,
    valor_venda numeric(10,2) NOT NULL,
    CONSTRAINT itens_venda_quantidade_venda_item_check CHECK ((quantidade_venda_item > 0)),
    CONSTRAINT itens_venda_valor_venda_check CHECK ((valor_venda >= (0)::numeric))
);


ALTER TABLE public.itens_venda OWNER TO postgres;

--
-- Name: TABLE itens_venda; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.itens_venda IS 'Itens pertencentes a uma venda';


--
-- Name: produtos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.produtos (
    id integer NOT NULL,
    nome_produto character varying(100) NOT NULL,
    quantidade_produto_estoque integer NOT NULL,
    data_validade_produto date NOT NULL,
    CONSTRAINT produtos_quantidade_produto_estoque_check CHECK ((quantidade_produto_estoque >= 0))
);


ALTER TABLE public.produtos OWNER TO postgres;

--
-- Name: TABLE produtos; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.produtos IS 'Cadastro de produtos';


--
-- Name: produtos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.produtos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.produtos_id_seq OWNER TO postgres;

--
-- Name: produtos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.produtos_id_seq OWNED BY public.produtos.id;


--
-- Name: vendas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vendas (
    id integer NOT NULL,
    id_cliente integer NOT NULL,
    data_venda date DEFAULT CURRENT_DATE NOT NULL
);


ALTER TABLE public.vendas OWNER TO postgres;

--
-- Name: TABLE vendas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.vendas IS 'Cabeçalho das vendas';


--
-- Name: vendas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vendas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vendas_id_seq OWNER TO postgres;

--
-- Name: vendas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vendas_id_seq OWNED BY public.vendas.id;


--
-- Name: clientes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes ALTER COLUMN id SET DEFAULT nextval('public.clientes_id_seq'::regclass);


--
-- Name: produtos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos ALTER COLUMN id SET DEFAULT nextval('public.produtos_id_seq'::regclass);


--
-- Name: vendas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas ALTER COLUMN id SET DEFAULT nextval('public.vendas_id_seq'::regclass);


--
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clientes (id, nome_cliente, cpf_cliente, endereco_cliente, telefone_cliente) FROM stdin;
1	João da Silva	12345678901	Rua das Flores, 125 - Centro	(44) 99911-1111
2	Maria Oliveira	23456789012	Av. Brasil, 450 - Zona 01	(44) 99922-2222
3	Carlos Pereira	34567890123	Rua Paraná, 980 - Vila Esperança	(44) 99933-3333
4	Ana Souza	45678901234	Rua XV de Novembro, 220	(44) 99944-4444
5	Fernanda Lima	56789012345	Av. Colombo, 1500	(44) 99955-5555
6	Roberto Almeida	67890123456	Rua Pioneiro José dos Santos, 89	(44) 99966-6666
7	Patrícia Costa	78901234567	Rua Mandaguari, 312	(44) 99977-7777
8	Ricardo Fernandes	89012345678	Av. Morangueira, 720	(44) 99988-8888
9	Juliana Martins	90123456789	Rua Néo Alves Martins, 1450	(44) 99999-9999
10	Eduardo Rodrigues	01234567890	Av. Pedro Taques, 2100	(44) 99800-0000
\.


--
-- Data for Name: itens_venda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itens_venda (id_venda, id_produto, quantidade_venda_item, valor_venda) FROM stdin;
1	1	2	32.90
1	12	1	8.50
2	3	1	24.90
2	15	2	11.80
3	5	3	17.70
3	18	1	6.90
4	7	2	19.80
4	20	1	12.50
5	9	1	15.90
5	22	2	10.40
6	11	1	8.90
6	24	3	18.60
7	13	2	14.80
7	26	1	7.90
8	15	1	5.90
8	28	2	16.40
9	17	4	11.60
9	30	1	21.90
10	19	2	18.80
10	32	1	9.50
11	21	1	13.90
11	34	2	12.40
12	23	2	17.80
12	36	1	6.50
13	25	1	28.90
13	38	2	15.80
14	27	3	12.60
14	40	1	5.90
15	29	2	22.40
15	42	1	18.90
16	31	1	14.90
16	44	2	10.80
17	33	2	19.60
17	46	1	11.90
18	35	1	9.90
18	48	2	23.80
19	37	3	16.50
19	50	1	7.90
20	39	2	13.80
20	2	1	26.90
21	41	1	18.90
21	4	2	12.60
22	43	2	21.80
22	6	1	9.90
23	45	1	7.50
23	8	3	17.70
24	47	2	24.80
24	10	1	13.90
25	49	1	29.90
25	14	2	10.40
26	16	3	15.60
26	18	1	8.90
27	20	2	18.20
27	22	1	11.90
28	24	1	6.80
28	26	2	19.40
29	28	2	17.60
29	30	1	22.50
30	32	1	9.80
30	34	3	14.70
\.


--
-- Data for Name: produtos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.produtos (id, nome_produto, quantidade_produto_estoque, data_validade_produto) FROM stdin;
1	Arroz Tipo 1 - 5kg	80	2027-06-15
2	Feijão Carioca - 1kg	120	2027-04-20
3	Açúcar Cristal - 5kg	60	2027-08-12
4	Sal Refinado - 1kg	150	2028-01-10
5	Óleo de Soja - 900ml	90	2027-10-15
6	Macarrão Espaguete - 500g	140	2027-09-18
7	Molho de Tomate - 340g	100	2027-05-25
8	Farinha de Trigo - 5kg	50	2027-07-30
9	Café Torrado - 500g	70	2027-11-05
10	Leite UHT Integral - 1L	200	2027-03-12
11	Margarina - 500g	65	2027-04-15
12	Manteiga - 200g	40	2027-02-28
13	Queijo Mussarela - 500g	35	2027-02-20
14	Presunto Cozido - 500g	30	2027-02-18
15	Refrigerante Cola - 2L	110	2027-12-20
16	Água Mineral - 1,5L	180	2028-06-30
17	Suco de Laranja - 1L	75	2027-05-10
18	Biscoito Recheado - 140g	160	2027-09-01
19	Chocolate ao Leite - 90g	130	2027-08-18
20	Achocolatado em Pó - 400g	85	2027-10-08
21	Sabão em Pó - 1kg	55	2029-01-01
22	Detergente Líquido - 500ml	140	2029-01-01
23	Amaciante - 2L	45	2029-01-01
24	Água Sanitária - 2L	60	2029-01-01
25	Desinfetante - 2L	70	2029-01-01
26	Esponja de Limpeza	180	2030-01-01
27	Papel Higiênico - 12 rolos	95	2030-01-01
28	Creme Dental - 90g	100	2028-08-15
29	Escova de Dentes	120	2030-01-01
30	Sabonete - 90g	200	2029-12-31
31	Shampoo - 350ml	65	2028-10-20
32	Condicionador - 350ml	60	2028-10-20
33	Leite Condensado - 395g	90	2027-11-18
34	Creme de Leite - 200g	95	2027-10-30
35	Milho Verde - Lata	110	2027-09-22
36	Ervilha - Lata	105	2027-09-22
37	Atum Ralado - Lata	70	2028-03-15
38	Sardinha - Lata	75	2028-04-01
39	Vinagre de Álcool - 750ml	80	2029-01-01
40	Azeite de Oliva - 500ml	40	2028-07-15
41	Banana Prata - kg	35	2026-08-10
42	Maçã Gala - kg	40	2026-08-15
43	Laranja Pera - kg	50	2026-08-12
44	Tomate - kg	45	2026-08-08
45	Batata Inglesa - kg	70	2026-09-10
46	Cebola - kg	60	2026-09-20
47	Alface Crespa - unidade	25	2026-08-05
48	Cenoura - kg	55	2026-08-18
49	Ovos Brancos - Dúzia	90	2026-09-05
50	Frango Congelado - kg	40	2027-01-20
\.


--
-- Data for Name: vendas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vendas (id, id_cliente, data_venda) FROM stdin;
1	1	2026-08-01
2	2	2026-08-01
3	3	2026-08-02
4	4	2026-08-02
5	5	2026-08-03
6	6	2026-08-03
7	7	2026-08-04
8	8	2026-08-04
9	9	2026-08-05
10	10	2026-08-05
11	1	2026-08-06
12	2	2026-08-06
13	3	2026-08-07
14	4	2026-08-07
15	5	2026-08-08
16	6	2026-08-08
17	7	2026-08-09
18	8	2026-08-09
19	9	2026-08-10
20	10	2026-08-10
21	2	2026-08-11
22	5	2026-08-11
23	1	2026-08-12
24	3	2026-08-12
25	7	2026-08-13
26	9	2026-08-13
27	4	2026-08-14
28	6	2026-08-14
29	8	2026-08-15
30	10	2026-08-15
\.


--
-- Name: clientes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clientes_id_seq', 10, true);


--
-- Name: produtos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.produtos_id_seq', 50, true);


--
-- Name: vendas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vendas_id_seq', 30, true);


--
-- Name: clientes clientes_cpf_cliente_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_cpf_cliente_key UNIQUE (cpf_cliente);


--
-- Name: clientes clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (id);


--
-- Name: itens_venda pk_itens_venda; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT pk_itens_venda PRIMARY KEY (id_venda, id_produto);


--
-- Name: produtos produtos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.produtos
    ADD CONSTRAINT produtos_pkey PRIMARY KEY (id);


--
-- Name: vendas vendas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT vendas_pkey PRIMARY KEY (id);


--
-- Name: idx_cliente_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cliente_nome ON public.clientes USING btree (nome_cliente);


--
-- Name: idx_itens_produto; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_itens_produto ON public.itens_venda USING btree (id_produto);


--
-- Name: idx_produto_nome; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_produto_nome ON public.produtos USING btree (nome_produto);


--
-- Name: idx_vendas_cliente; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_vendas_cliente ON public.vendas USING btree (id_cliente);


--
-- Name: itens_venda fk_item_produto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT fk_item_produto FOREIGN KEY (id_produto) REFERENCES public.produtos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: itens_venda fk_item_venda; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itens_venda
    ADD CONSTRAINT fk_item_venda FOREIGN KEY (id_venda) REFERENCES public.vendas(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: vendas fk_venda_cliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vendas
    ADD CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente) REFERENCES public.clientes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict LDfSepd22dFUOYSurlPb3vNfdBBPQcte2swvGbvFNkJqpOjUFAb9Y0dCeygAYoa

