library(regpro)


### Name: emp.distribu
### Title: Empirical distribution function at one point
### Aliases: emp.distribu
### Keywords: multivariate smooth

### ** Examples

set.seed(2)
n<-100
d<-2 
x<-matrix(runif(n*d),n,d)

arg<-c(0,0)
emp.distribu(arg,x)



