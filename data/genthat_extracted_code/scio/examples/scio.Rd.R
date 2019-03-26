library(scio)


### Name: scio
### Title: Sparse Column-wise Inverse Operator
### Aliases: scio
### Keywords: multivariate models graphs

### ** Examples

set.seed(100)
x<-matrix(rnorm(50*20),ncol=4)
s<- var(x)
a<-scio(s, lambda=.01)



