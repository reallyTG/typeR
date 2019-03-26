library(RMediation)


### Name: qMC
### Title: Quantile for the Monte Carlo Sampling Distribution of a
###   nonlinear function of coefficients estimates
### Aliases: qMC
### Keywords: distribution regression

### ** Examples

qMC(.05,mu=c(b1=1,b2=.7,b3=.6, b4= .45), Sigma=c(.05,0,0,0,.05,0,0,.03,0,.03), 
quant=~b1*b2*b3*b4)



