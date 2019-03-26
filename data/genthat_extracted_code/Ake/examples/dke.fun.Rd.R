library(Ake)


### Name: dke.fun
### Title: Function for density estimation
### Aliases: dke.fun dke.fun.default
### Keywords: smooth nonparametric

### ** Examples

## A sample data with n=100.
V<-rgamma(100,1.5,2.6)
##The bandwidth can be the one obtained by cross validation.
h<-0.052
## We choose Gamma kernel.

est<-dke.fun(V,h,"continuous","GA")



