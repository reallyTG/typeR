library(circular)


### Name: wrappedCauchy
### Title: Wrapped Cauchy Density Function
### Aliases: dwrappedcauchy rwrappedcauchy
### Keywords: distribution

### ** Examples


data1 <- rwrappedcauchy(100, mu=circular(0), rho=0.7, 
  control.circular=list(units="degrees"))
plot(data1)

ff <- function(x) dwrappedcauchy(x, mu=circular(pi), rho=0.7)
curve.circular(ff, join=TRUE, xlim=c(-2, 1), 
  main="Density of a Wrapped Cauchy Distribution \n mu=pi, rho=0.7")




