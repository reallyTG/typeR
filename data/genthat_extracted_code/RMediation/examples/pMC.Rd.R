library(RMediation)


### Name: pMC
### Title: Probability (percentile) for the Monte Carlo Sampling
###   Distribution of a nonlinear function of coefficients estimates
### Aliases: pMC
### Keywords: distribution regression

### ** Examples

pMC(.2,mu=c(b1=1,b2=.7,b3=.6, b4= .45), Sigma=c(.05,0,0,0,.05,0,0,.03,0,.03), 
quant=~b1*b2*b3*b4)



