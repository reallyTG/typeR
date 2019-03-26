## ---- echo = FALSE-------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----peekSwiss-----------------------------------------------------------
head(swiss)

## ----blueprintDesign-----------------------------------------------------
library(mason)
design(swiss, 'glm')

## ----settings------------------------------------------------------------
library(magrittr)
dp <- design(swiss, 'glm') %>% 
    add_settings(family = gaussian())

## ----variables-----------------------------------------------------------
dp <- dp %>% 
    add_variables('yvars', c('Fertility', 'Infant.Mortality')) %>% 
    add_variables('xvars', c('Education', 'Agriculture'))

## ----construct-----------------------------------------------------------
dp <- construct(dp)
dp

## ----constructCovar------------------------------------------------------
dp2 <- dp %>%
    add_variables('covariates', 'Catholic') %>% 
    construct()
dp2

## ----scrub---------------------------------------------------------------
dp_clean <- dp2 %>% 
    scrub()

## ----scrubDetails--------------------------------------------------------
colnames(dp2)
colnames(dp_clean)
names(attributes(dp2))
names(attributes(dp_clean))
class(dp2)
class(dp_clean)

## ----oneGo---------------------------------------------------------------
swiss %>% 
    design('glm') %>% 
    add_settings() %>% 
    add_variables('yvars', c('Fertility', 'Infant.Mortality')) %>% 
    add_variables('xvars', c('Education', 'Agriculture')) %>% 
    construct() %>% 
    add_variables('covariates', 'Catholic') %>% 
    construct() %>% 
    scrub()

