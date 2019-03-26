library(generalCorr)


### Name: someMagPairs
### Title: Summary magnitudes after removing control variables in several
###   pairs where dependent variable is fixed.
### Aliases: someMagPairs
### Keywords: derivatives partial

### ** Examples


  set.seed(34);x=sample(1:10);y=1+2*x+rnorm(10);z=sample(2:11)
  w=runif(10)
  ss=someMagPairs(cbind(y,x,z),ctrl=w)




