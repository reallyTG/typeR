## ----Install package from CRAN, eval=FALSE-------------------------------
#  install.packages("spAddins")

## ----Install package from GitHub, eval=FALSE-----------------------------
#  if (!require(devtools)) install.packages("devtools")
#  library(devtools)
#  install_github("GegznaV/spAddins")

## ---- include = FALSE----------------------------------------------------
library(magrittr)

## ---- eval = FALSE-------------------------------------------------------
#  library(magrittr)

## ---- eval = FALSE-------------------------------------------------------
#  ?magrittr::`%$%`

## ---- eval = FALSE-------------------------------------------------------
#  table(CO2$Type, CO2$Treatment)

## ---- eval = FALSE-------------------------------------------------------
#  CO2  table(Type, Treatment)

## ------------------------------------------------------------------------
CO2  %$%  table(Type, Treatment)

