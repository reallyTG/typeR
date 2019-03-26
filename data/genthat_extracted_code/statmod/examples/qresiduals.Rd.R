library(statmod)


### Name: qresiduals
### Title: Randomized Quantile Residuals
### Aliases: qresiduals qresid qres.binom qres.pois qres.nbinom qres.gamma
###   qres.invgauss qres.tweedie qres.default
### Keywords: regression

### ** Examples

#  Poisson example: quantile residuals show no granularity
y <- rpois(20,lambda=4)
x <- 1:20
fit <- glm(y~x, family=poisson)
qr <- qresiduals(fit)
qqnorm(qr)
abline(0,1)

#  Gamma example:
#  Quantile residuals are nearly normal while usual resids are not
y <- rchisq(20, df=1)
fit <- glm(y~1, family=Gamma)
qr <- qresiduals(fit, dispersion=2)
qqnorm(qr)
abline(0,1)

#  Negative binomial example:
if(require("MASS")) {
fit <- glm(Days~Age,family=negative.binomial(2),data=quine)
summary(qresiduals(fit))
fit <- glm.nb(Days~Age,link=log,data = quine)
summary(qresiduals(fit))
}



