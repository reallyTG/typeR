## ---- warning=FALSE, message=FALSE---------------------------------------
library(rcongresso)
library(DT)
library(dplyr)
library(knitr)

## ------------------------------------------------------------------------
pl4302_id <- fetch_id_proposicao(tipo = "PL", numero = 4302, ano = 1998)

## ------------------------------------------------------------------------
pl4302 <- fetch_proposicao(id = pl4302_id)
glimpse(pl4302)

## ------------------------------------------------------------------------
votacoes_pl4302 <- fetch_votacoes(id_prop=pl4302_id)

votacoes_pl4302 %>% 
  select(id, titulo, placarSim, placarNao, placarAbstencao) %>% 
  kable()

## ------------------------------------------------------------------------
fetch_votacao(id_votacao=7431) %>% 
  glimpse()

## ------------------------------------------------------------------------
fetch_orientacoes(id_votacao=7431) %>% 
  select(nomeBancada, voto) %>% 
  datatable()

## ------------------------------------------------------------------------
fetch_votos(id_votacao=7431) %>% 
  select(parlamentar.id, 
         parlamentar.nome, 
         parlamentar.siglaPartido, 
         voto) %>% 
  datatable()

## ------------------------------------------------------------------------
fetch_deputado(178957) %>%
  select(-uri) %>%
  kable()

