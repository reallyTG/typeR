library(scio)


### Name: scio.refit
### Title: Refitted Sparse Column-wise Inverse Operator
### Aliases: scio.refit
### Keywords: multivariate models graphs

### ** Examples

set.seed(100)
x<-matrix(rnorm(50*20),ncol=4)
s<- var(x)
a<-scio(s, lambda=.01)

require(QUIC) 
b <- scio.refit(s, a$w)



