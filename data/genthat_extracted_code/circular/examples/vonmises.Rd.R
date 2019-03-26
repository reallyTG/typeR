library(circular)


### Name: vonMises
### Title: von Mises Density Function
### Aliases: vonMises dvonmises rvonmises pvonmises qvonmises
### Keywords: distribution

### ** Examples


data1 <- rvonmises(100, circular(0), 10, control.circular=list(units="degrees"))
plot(data1)

ff <- function(x) dvonmises(x, mu=circular(pi), kappa=10)
curve.circular(ff, join=TRUE, xlim=c(-2.3, 1),
  main="Density of a VonMises Distribution \n mu=pi, kappa=10")

ff <- function(x) pvonmises(x, mu=circular(pi), kappa=10)
curve.circular(ff, join=FALSE, xlim=c(-2, 2), ylim=c(-2, 1), 
  to=(2*pi-3*.Machine$double.eps), modulo="asis", nosort=TRUE, 
  main="Probability of a VonMises Distribution \n mu=pi, kappa=10")

plot(function(x) qvonmises(x, mu=circular(0), kappa=5), from=0, to=1)
##curve do not work!
plot(function(x) qvonmises(x, mu=circular(pi), kappa=5), from=0, to=1)
plot(function(x) qvonmises(x, mu=circular(pi), kappa=5, from=circular(pi/2)), from=0, to=1)



