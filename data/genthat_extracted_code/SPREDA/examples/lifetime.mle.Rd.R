library(SPREDA)


### Name: lifetime.mle
### Title: Calculate MLE for Lifetime Distribution
### Aliases: lifetime.mle miniusloglik.sev

### ** Examples

#censored samples from Weibull distribution
dat=cbind(c(1.1,2,3.6,4,5.3,7,7,7), c(1,1,1,1,1,0,0,0))
res=lifetime.mle(dat, minusloglik=miniusloglik.sev, starts=c(0,1))
res$coef  #return \eqn{u, log(\sigma)}



