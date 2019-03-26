## ---- warning=FALSE, message=FALSE---------------------------------------
library(rcongresso)
library(dplyr)
library(tidyr)
library(purrr)
library(ggplot2)

## ------------------------------------------------------------------------
frame_data(
  ~tipo, ~numero, ~ano,
  "PEC", 241, 2016) %>% # PEC dos gastos públicos
  pmap(fetch_id_proposicao) %>%
  map_df(fetch_proposicao) %>%
  glimpse()

## ------------------------------------------------------------------------
frame_data(
  ~tipo, ~numero, ~ano,
  "PEC", 241, 2016, # PEC dos gastos públicos
  "PL", 4474, 2016, # PL dos correios
  "PL", 3722, 2012, # PL do estatuto do desarmamento
  "PL", 158, 2015) %>% # PL da proibição do porte e consumo de drogas
  pmap(fetch_id_proposicao) %>%
  map_df(fetch_proposicao) %>%
  glimpse()

## ------------------------------------------------------------------------
fetch_proposicao(id = 2088351) %>%
  glimpse()

## ------------------------------------------------------------------------
ids <- c(611966, 291906, 333205, 458609, 517924, 1999440, 2090343)

fetch_proposicao(ids) %>%
  glimpse()

## ------------------------------------------------------------------------
fetch_proposicao(dataApresentacaoInicio = "2017-01-01", dataApresentacaoFim = "2017-01-31") %>%
  glimpse()

## ------------------------------------------------------------------------
fetch_proposicao(dataInicio = "2017-11-01", dataFim = "2017-11-30") %>%
  glimpse()

## ------------------------------------------------------------------------
fetch_proposicao(siglaPartidoAutor = "PSC", itens = 100) %>%
  glimpse()

## ------------------------------------------------------------------------
estados_nordeste <- c("RN", "PB", "CE", "PE", "SE", "AL", "BA", "PI", "MA")

fetch_proposicao(siglaUfAutor = estados_nordeste, itens = 100) %>%
  glimpse()

## ------------------------------------------------------------------------
autores <- c("Luiza Erundina", "Pedro Fernandes", "Haroldo Lima", "Jandira")

tryCatch(
  fetch_proposicao(autor = autores) %>%
    glimpse()
)

