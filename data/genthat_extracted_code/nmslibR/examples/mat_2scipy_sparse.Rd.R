library(nmslibR)


### Name: mat_2scipy_sparse
### Title: conversion of an R matrix to a scipy sparse matrix
### Aliases: mat_2scipy_sparse

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("scipy")) {

  library(nmslibR)

  set.seed(1)

  x = matrix(runif(1000), nrow = 100, ncol = 10)

  res = mat_2scipy_sparse(x)

  print(dim(x))

  print(res$shape)
}



