library(SIS)


### Name: standardize
### Title: Standardization of High-Dimensional Design Matrices
### Aliases: standardize
### Keywords: models

### ** Examples


set.seed(0)
n = 400; p = 50; rho = 0.5
corrmat = diag(rep(1-rho, p)) + matrix(rho, p, p)
corrmat[,4] = sqrt(rho)
corrmat[4, ] = sqrt(rho)
corrmat[4,4] = 1
corrmat[,5] = 0
corrmat[5, ] = 0
corrmat[5,5] = 1
cholmat = chol(corrmat)
x = matrix(rnorm(n*p, mean=15, sd=9), n, p)
x = x%*%cholmat

x.standard = standardize(x)




