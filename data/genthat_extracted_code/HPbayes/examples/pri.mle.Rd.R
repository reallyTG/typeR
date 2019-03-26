library(HPbayes)


### Name: pri.mle
### Title: Heligman-Pollard parameter prior formation for use with Bayesian
###   Melding using IMIS
### Aliases: pri.mle
### Keywords: misc

### ** Examples

data(HPprior) ##loads a vector of persons at risk (lx) and deaths (dx)
prior <- pri.mle(nrisk=lx, ndeath=dx)
summary(prior$q0)



