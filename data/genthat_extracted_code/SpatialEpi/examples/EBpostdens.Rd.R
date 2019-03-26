library(SpatialEpi)


### Name: EBpostdens
### Title: Produce plots of emprical Bayes posterior densities when the
###   data Y are Poisson with expected number E and relative risk theta,
###   with the latter having a gamma distribution with known values alpha
###   and beta, which are estimated using empirical Bayes.
### Aliases: EBpostdens
### Keywords: file

### ** Examples

data(scotland)
Y <- scotland$data$cases
E <- scotland$data$expected
ebresults <- eBayes(Y,E)
EBpostdens(Y[1], E[1], ebresults$alpha, ebresults$beta, lower=0, upper=15,
main="Area 1")



