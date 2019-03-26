library(circular)


### Name: wrappedNormal
### Title: Wrapped Normal Density Function
### Aliases: dwrappednormal rwrappednormal pwrappednormal qwrappednormal
### Keywords: distribution

### ** Examples


data1 <- rwrappednormal(100, mu=circular(0), rho=0.7, 
  control.circular=list(units="degrees"))
plot(data1)

ff <- function(x) dwrappednormal(x, mu=circular(pi), rho=0.7)
curve.circular(ff, join=TRUE, xlim=c(-1.5, 1), 
  main="Density of a Wrapped Normal Distribution \n mu=pi, rho=0.7")

ff <- function(x) pwrappednormal(x, mu=circular(pi), rho=0.7)
curve.circular(ff, join=FALSE, xlim=c(-2, 2), ylim=c(-2, 2), 
  to=(2*pi-3*.Machine$double.eps), modulo="asis", nosort=TRUE, 
  main="Probability of a Wrapped Normal Distribution \n mu=pi, 
  rho=0.7, from=0")

ff <- function(x) pwrappednormal(x, mu=circular(pi), rho=0.7, from=circular(pi))
curve.circular(ff, join=FALSE, xlim=c(-2, 2), ylim=c(-2, 2), from=-pi, 
  to=(pi-3*.Machine$double.eps), modulo="asis", nosort=TRUE, 
  main="Probability of a Wrapped Normal Distribution \n mu=pi, 
  rho=0.7, from=pi")

plot(qwrappednormal, from=0, to=1)
plot(function(x) qwrappednormal(p=x, mu=circular(pi)), from=0, to=1)



