## ----setup, include = FALSE----------------------------------------------
library(keras)
knitr::opts_chunk$set(comment = NA, eval = FALSE)

## ------------------------------------------------------------------------
#  library(keras)
#  use_backend("theano")

## ------------------------------------------------------------------------
#  library(keras)
#  use_backend("cntk")

## ------------------------------------------------------------------------
#  library(keras)
#  use_implementation("tensorflow")

## ------------------------------------------------------------------------
#  library(keras)
#  inputs <- k_placeholder(shape = c(2, 4, 5))
#  # also works:
#  inputs <-  k_placeholder(shape = list(NULL, 4, 5))
#  # also works:
#  inputs <- k_placeholder(ndim = 3)

## ------------------------------------------------------------------------
#  val <- array(runif(60), dim = c(3L, 4L, 5L))
#  var <- k_variable(value = val)
#  
#  # all-zeros variable:
#  var <- k_zeros(shape = c(3, 4, 5))
#  # all-ones:
#  var <- k_ones(shape = c(3, 4, 5))

