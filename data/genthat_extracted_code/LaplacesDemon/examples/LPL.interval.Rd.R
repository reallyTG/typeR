library(LaplacesDemon)


### Name: LPL.interval
### Title: Lowest Posterior Loss Interval
### Aliases: LPL.interval
### Keywords: Credible Interval Credible Region Credible Set LPL LPLI
###   Probability Interval Probability Region Probability Set

### ** Examples

library(LaplacesDemon)
#Although LPL is intended to be applied to output from LaplacesDemon or
#PMC, here is an example in which p(theta) ~ N(0,100), and
#p(theta | y) ~ N(1,10), given 1000 samples.
theta <- rnorm(1000,1,10)
LPL.interval(Prior=dnorm(theta,0,100^2), Posterior=theta, prob=0.95,
  plot=TRUE)
#A more practical example follows, but it assumes a model has been
#updated with LaplacesDemon or PMC, the output object is called Fit, and
#that the prior for the third parameter is normally distributed with
#mean 0 and variance 100: 
#temp <- Fit$Posterior2[,3]
#names(temp) <- colnames(Fit$Posterior2)[3]
#LPL.interval(Prior=dnorm(temp,0,100^2), Posterior=temp, prob=0.95,
#     plot=TRUE, PDF=FALSE)



