## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE, collapse = TRUE, comment = "#>")

## ----results='hide', echo=FALSE, message=FALSE, warning=FALSE------------
library(magrittr)
library(stringr)
library(dplyr)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("sidrar")

## ---- eval=FALSE---------------------------------------------------------
#  library(devtools)
#  install_github("rpradosiqueira/sidrar")

## ---- eval=FALSE---------------------------------------------------------
#  get_sidra          It recovers data from the geven table
#                     according to the parameters
#  
#  info_sidra         It allows you to check what parameters
#                     are available for a table via an web browser
#  
#  search_sidra       It searches which tables have a particular
#                     word in their names

## ---- eval = FALSE-------------------------------------------------------
#  library(sidrar)
#  
#  get_sidra(x = 1419,
#            variable = 63,
#            period = c("last" = 12),
#            geo = "City",
#            geo.filter = 5002407,
#            classific = "c315",
#            category = list(7169),
#            header = FALSE,
#            format = 3)
#  

## ---- echo = FALSE-------------------------------------------------------
## Tabela obtida
library(sidrar)

get_sidra(x = 1419,
          variable = 63,
          period = c(last = "12"),
          geo = "City",
          geo.filter = 5002704,
          classific = "c315",
          category = list(7169),
          header = FALSE,
          format = 3)


## ---- eval = FALSE-------------------------------------------------------
#  get_sidra(x = 5939,
#            variable = 529,
#            period = "2014",
#            geo = "State",
#            header = TRUE,
#            format = 1)
#  

## ---- echo = FALSE-------------------------------------------------------
get_sidra(x = 5939,
          variable = 529,
          period = "2014",
          geo = "State",
          header = TRUE,
          format = 1)


## ---- eval = FALSE-------------------------------------------------------
#  get_sidra(api = "/t/1378/n1/all/n2/all/v/all/p/all/c1/all/c2/0/c287/0/c455/all/d/v1000093%202")
#  

## ---- echo = FALSE-------------------------------------------------------
get_sidra(api = "/t/1378/n1/all/n2/all/v/all/p/all/c1/all/c2/0/c287/0/c455/all/d/v1000093%202")


## ---- echo = FALSE-------------------------------------------------------
info_sidra(5939)

## ---- eval=FALSE---------------------------------------------------------
#  info_sidra(5939, wb = TRUE)

## ---- echo=FALSE, error=TRUE---------------------------------------------
cat("Can the web browser be open? (y/n): ")

## ------------------------------------------------------------------------
search_sidra(c("gini"))

