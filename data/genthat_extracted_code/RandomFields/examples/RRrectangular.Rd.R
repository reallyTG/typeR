library(RandomFields)


### Name: RRrectangular
### Title: Random scaling used with balls
### Aliases: RRrectangular
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
# simulation of Gaussian variables (in a not very straightforward way):
distr <- RRrectangular(RMgauss(), approx=FALSE)
z <- RFrdistr(distr, n=1000000)
hist(z, 200, freq=!TRUE)
x <- seq(-10, 10, 0.1)
lines(x, dnorm(x, sd=sqrt(0.5)))


#creation of random variables whose density is proportional
# to the spherical model:
distr <- RRrectangular(RMspheric(), approx=FALSE)
z <- RFrdistr(distr, n=1000000)
hist(z, 200, freq=!TRUE)
## Don't show: 
StartExample(reduced=FALSE, save.seed=FALSE)
## End(Don't show)
x <- seq(-10, 10, 0.01)
lines(x, 4/3 * RFcov(RMspheric(), x))
## Don't show: 
FinalizeExample()
## End(Don't show)


