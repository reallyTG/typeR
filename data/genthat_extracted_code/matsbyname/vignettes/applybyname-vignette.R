## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(dplyr)
library(matsbyname)

## ------------------------------------------------------------------------
U <- matrix(1:4, ncol = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>%
  setrowtype("Products") %>% setcoltype("Industries")
U
difference_byname(0, U)
unaryapply_byname(`-`, U)

## ------------------------------------------------------------------------
divide <- function(x, divisor){
  x/divisor
}
m <- matrix(c(1:4), nrow = 2, ncol = 2, dimnames = list(c("r1", "r2"), c("c1", "c2"))) %>% 
  setrowtype("row") %>% setcoltype("col")
m
elementapply_byname(divide, a = m, row = 1, col = 1, .FUNdots = list(divisor = 2))

## ------------------------------------------------------------------------
U <- matrix(1:4, ncol = 2, dimnames = list(c("p1", "p2"), c("i1", "i2"))) %>%
  setrowtype("Products") %>% setcoltype("Industries")
U
Y <- matrix(1:4, ncol = 2, dimnames = list(c("p2", "p1"), c("i2", "i1"))) %>%
  setrowtype("Products") %>% setcoltype("Industries")
Y
sum_byname(U, Y)
binaryapply_byname(`+`, U, Y)

## ------------------------------------------------------------------------
cumapply_byname(sum_byname, list(1, 2, 3, 4))
cumapply_byname(hadamardproduct_byname, list(1, 2, 3, 4))

