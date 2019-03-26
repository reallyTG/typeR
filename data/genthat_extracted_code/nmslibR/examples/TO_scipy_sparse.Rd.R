library(nmslibR)


### Name: TO_scipy_sparse
### Title: conversion of an R sparse matrix to a scipy sparse matrix
### Aliases: TO_scipy_sparse

### ** Examples


if (reticulate::py_available() && reticulate::py_module_available("scipy")) {
  
  if (Sys.info()["sysname"] != 'Darwin') {

    library(nmslibR)
  
  
    # 'dgCMatrix' sparse matrix
    #--------------------------
  
    data = c(1, 0, 2, 0, 0, 3, 4, 5, 6)
  
    dgcM = Matrix::Matrix(data = data, nrow = 3,
  
                          ncol = 3, byrow = TRUE,
  
                          sparse = TRUE)
  
    print(dim(dgcM))
  
    res = TO_scipy_sparse(dgcM)
  
    print(res$shape)
    
    
    # 'dgRMatrix' sparse matrix
    #--------------------------
    
    dgrM = as(dgcM, "RsparseMatrix")
    
    print(dim(dgrM))
  
    res_dgr = TO_scipy_sparse(dgrM)
  
    print(res_dgr$shape)
  }
}



