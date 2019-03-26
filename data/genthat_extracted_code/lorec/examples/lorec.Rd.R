library(lorec)


### Name: lorec
### Title: LOw Rank and sparsE Covariance estimation
### Aliases: lorec
### Keywords: multivariate models

### ** Examples

set.seed(100)
Sig <- matrix(0.8, 4,4) + diag(0.2,4)
x<-matrix(rnorm(50*20),ncol=4)
s<- var(x)
a<-lorec(s, lambda=.01, delta=0.01)



