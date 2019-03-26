## ----results='hide'------------------------------------------------------
data(package = "raw")

## ----results='hide'------------------------------------------------------
library(raw)
?COTOR2

## ----results='hide'------------------------------------------------------
data(PPA)
head(PPA_LossDevelopment)

## ------------------------------------------------------------------------
data("Hurricane")

hist(Hurricane$Wind, xlab = "Wind Speed (knots)", main = "")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("raw", dependencies = "Suggests")

## ------------------------------------------------------------------------
library(mondate)
endOfQuarter <- mondate("2010-03-31")
mondate::add(endOfQuarter, 3, "months")

## ----eval=FALSE----------------------------------------------------------
#  install.packages("rstan")

## ------------------------------------------------------------------------
library(tidyverse)

## ----results='hide'------------------------------------------------------
library(lubridate)
myDate <- mdy("2/16/1972")
year(myDate) <- 2016

## ------------------------------------------------------------------------
library(scales)
data("COTOR2")
head(COTOR2)
head(dollar(COTOR2))

## ----eval=FALSE----------------------------------------------------------
#  devtools::install_github("PirateGrunt/raw")

