library(spdep)


### Name: as_dgRMatrix_listw
### Title: Interface between Matrix class objects and weights lists
### Aliases: as_dgRMatrix_listw as_dsTMatrix_listw as_dsCMatrix_I
###   as_dsCMatrix_IrW Jacobian_W coerce,listw,CsparseMatrix-method
###   coerce,listw,RsparseMatrix-method coerce,listw,symmetricMatrix-method
### Keywords: spatial

### ** Examples

example(NY_data)
W_C <- as(listw_NY, "CsparseMatrix")
W_R <- as(listw_NY, "RsparseMatrix")
W_S <- as(listw_NY, "symmetricMatrix")
n <- nrow(W_S)
I <- Diagonal(n)
rho <- 0.1
c(determinant(I - rho * W_S, logarithm=TRUE)$modulus)
sum(log(1 - rho * eigenw(listw_NY)))
nW <- - W_S
nChol <- Cholesky(nW, Imult=8)
n * log(rho) + (2 * c(determinant(update(nChol, nW, 1/rho))$modulus))



