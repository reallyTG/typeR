## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
library(ML.MSBD)
set.seed(25)

## ------------------------------------------------------------------------
tree <- ape::rcoal(10)

## ---- eval=FALSE---------------------------------------------------------
#  ML_MSBD(tree, initial_values = c(0.1, 10, 1), time_mode = "mid")

## ------------------------------------------------------------------------
tree_stt <- ape::rtree(10)

## ---- eval=FALSE---------------------------------------------------------
#  ML_MSBD(tree_stt, initial_values = c(0.1, 10, 1), rho = 0.5, sigma = 0.1, time_mode = "mid")
#  
#  ML_MSBD(tree_stt, initial_values = c(0.1, 10, 1), rho_sampling = FALSE, sigma = 0.1, time_mode = "mid")

## ---- eval=FALSE---------------------------------------------------------
#  ML_MSBD(tree, initial_values = c(0.1, 10, 1), c(0.1, 10, 0.5, 1), sigma = 1, stepsize = 0.1, time_mode = "mid")

## ------------------------------------------------------------------------
likelihood_MSBD(tree, shifts = matrix(c(2,0.8,2), nrow = 1), gamma = 0.05, lambdas = c(10, 6), mus = c(1, 0.5))

## ------------------------------------------------------------------------
likelihood_MSBD(tree_stt, shifts = c(), gamma = 0.05, lambdas = 10, mus = 0.5, sigma = 0.5, rho_sampling = FALSE)
likelihood_MSBD(tree, shifts = c(), gamma = 0.05, lambdas = 10, mus = 0.5, lambda_rates = 0.1, stepsize = 0.05)

## ------------------------------------------------------------------------
tree_collapsed = ape::rcoal(4)
likelihood_MSBD_unresolved(tree_collapsed, shifts = matrix(c(2,0.25,2), nrow = 1), gamma = 0.05, lambdas = c(10, 6), mus = c(1, 0.5), lineage_counts = c(5,1,3,6), tcut = 0.1)
likelihood_MSBD_unresolved(tree_collapsed, shifts = matrix(c(2,0.25,2), nrow = 1), gamma = 0.05, lambdas = c(10, 6), mus = c(1, 0.5), lineage_counts = c(5,1,3,6), tcut = c(0.1,0.0,0.15,0.4))

