library(regpro)


### Name: copula.trans
### Title: Makes a copula transformation
### Aliases: copula.trans
### Keywords: multivariate smooth

### ** Examples

set.seed(2)
n<-100
d<-2 
dendat<-matrix(runif(n*d),n,d)
x<-copula.trans(dendat)



