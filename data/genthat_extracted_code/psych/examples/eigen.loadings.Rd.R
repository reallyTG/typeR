library(psych)


### Name: eigen.loadings
### Title: Convert eigen vectors and eigen values to the more normal (for
###   psychologists) component loadings
### Aliases: eigen.loadings
### Keywords: models multivariate

### ** Examples

x <- eigen(Harman74.cor$cov)
x$vectors[1:8,1:4]  #as they appear from eigen
y <- princomp(covmat=Harman74.cor$cov) 
y$loadings[1:8,1:4] #as they appear from princomp
eigen.loadings(x)[1:8,1:4] # rescaled by the eigen values



