## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")

## ----results='hide', echo=FALSE, message=FALSE, warning=FALSE------------
library(magrittr)
library(stringr)
library(dplyr)

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github("rpradosiqueira/datasus")

## ---- eval=FALSE---------------------------------------------------------
#  sinasc_nv_uf       Scrapes SINASC data from the states unities
#  
#  sinasc_nv_mun      Scrapes SINASC data from municipalities
#  
#  sinasc_nv_bruf     Scrapes SINASC data from regions
#  
#  sim_obt10_uf       Scrapes SIM ICD-10 data from the states unities
#  
#  sim_obt10_mun      Scrapes SIM ICD-10 data from cities
#  
#  sim_obt10_bruf     Scrapes SIM ICD-10 data from regions
#  

## ---- eval = FALSE-------------------------------------------------------
#  library(datasus)
#  
#  sinasc_nv_uf(uf = "ms",
#               periodo = c(2011:2015),
#               coluna = "Ano do nascimento")
#  

## ---- echo = FALSE-------------------------------------------------------
## Tabela obtida
library(datasus)

sinasc_nv_uf(uf = "ms",
             periodo = c(2011:2015),
             coluna = "Ano do nascimento")


## ---- eval = FALSE-------------------------------------------------------
#  sim_obt10_mun(linha = "Microrregião IBGE",
#                coluna = "Capítulo CID-10")
#  

## ---- echo = FALSE-------------------------------------------------------
head(sim_obt10_mun(linha = "Microrregião IBGE",
                   coluna = "Capítulo CID-10"))


