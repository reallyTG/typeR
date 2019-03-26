## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
set.seed(123)

## ------------------------------------------------------------------------
library(sBIC)
gms = GaussianMixtures(maxNumComponents = 8, dim = 2, restarts = 100)

## ------------------------------------------------------------------------
library(MASS)
n = 175
class = sample(0:2, n, replace = TRUE)
X = (class == 0) * mvrnorm(n, mu = c(0, 0), Sigma = diag(2)) +
    (class == 1) * mvrnorm(n, mu = c(2.5, 2.5), Sigma = diag(1.3, 2)) +
    (class == 2) * mvrnorm(n, mu = c(-3, 2.5), Sigma = diag(1.2, 2))

## ------------------------------------------------------------------------
sBIC(X, gms)

