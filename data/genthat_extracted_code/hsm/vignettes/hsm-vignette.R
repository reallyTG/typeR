## ------------------------------------------------------------------------
map <- matrix(c(1, NA, 2, NA), ncol = 2, byrow = TRUE)
map
var <- list(1:10, 11:20)
var

## ------------------------------------------------------------------------
map <- matrix(c(1, 2, 2, 7, 3, 4, 4, 6, 6, 7, 6, 8, 3, 5, 5, 6), 
  ncol = 2, byrow = TRUE)
map 
var <- as.list(1:8)
var

## ------------------------------------------------------------------------
library(hsm)
map <- matrix(c(1, 2, 2, 7, 3, 4, 4, 6, 6, 7, 6, 8, 3, 5, 5, 6), 
  ncol = 2, byrow = TRUE)
var <- as.list(1:8)
paths(map, var)

## ----results='hide'------------------------------------------------------
library(hsm)
map <- matrix(c(1, 2, 2, 7, 3, 4, 4, 6, 6, 7, 6, 8, 3, 5, 5, 6), 
  ncol = 2, byrow = TRUE)
var <- as.list(1:8)
set.seed(100)
y <- rnorm(8)
result.path <- hsm.path(y=y, map=map, var=var, get.penalval=TRUE)

## ------------------------------------------------------------------------
round(result.path$beta.m, digits = 4)

