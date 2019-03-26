library(eel)


### Name: EEL_est
### Title: Extended empirical log likelihood ratio for parameters defined
###   by estimating equaitons
### Aliases: EEL_est EEL_est.default
### Keywords: EEL Estimating

### ** Examples

# EXAMPLE: computing the EEL for the mean of a bivariate random variable
# Generating a sample of n=40 bivariate observations. 
# For this example, we do this through a univariate normal random number generator.

uninorm<- rnorm(40*2,5,1)                          
multnorm<-matrix(uninorm,ncol=2)

# To calculate the EEL for a point theta=c(5,3), use
theta_tilda=colMeans(multnorm-as.vector(c(5,3)))
EEL_est(x=multnorm,theta=c(5,3),theta_tilda, "x-theta")




