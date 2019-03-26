library(regpro)


### Name: emp.quantile
### Title: Empirical quantile function at one point
### Aliases: emp.quantile
### Keywords: multivariate smooth

### ** Examples

set.seed(2)
n<-100
d<-2 
x<-matrix(runif(n*d),n,d)

arg<-c(0.5,0.5)
emp.quantile(arg,x)



