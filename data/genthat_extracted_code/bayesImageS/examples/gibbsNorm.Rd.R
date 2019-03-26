library(bayesImageS)


### Name: gibbsNorm
### Title: Fit a univariate normal (Gaussian) distribution to the observed
###   data.
### Aliases: gibbsNorm

### ** Examples

y <- rnorm(100,mean=5,sd=2)
res.norm <- gibbsNorm(y, priors=list(mu=0, mu.sd=1e6, sigma=1e-3, sigma.nu=1e-3))
summary(res.norm$mu[501:1000])
summary(res.norm$sigma[501:1000])



