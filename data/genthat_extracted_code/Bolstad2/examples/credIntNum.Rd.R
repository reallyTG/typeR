library(Bolstad2)


### Name: credIntNum
### Title: Calculate a credible interval from a numerically specified
###   posterior CDF
### Aliases: credIntNum

### ** Examples

## commands for calculating a numerical posterior CDF.
## In this example, the likelihood is proportional to
## \eqn{\theta^{3/2}\times \exp(-\theta/4)} and a N(6, 9) prior is used.
theta <- seq(from = 0.001, to = 40, by = 0.001)
prior <- dnorm(theta,6,3)
ppnLike <- theta^1.5*exp(-theta/4)
ppnPost <- prior*ppnLike
scaleFactor <- sintegral(theta, ppnPost)$int
posterior <- ppnPost/scaleFactor
cdf <- sintegral(theta, posterior)$y
ci<-credIntNum(theta, cdf)
par(mfrow=c(2,2))
plot(prior ~ theta, type = 'l',  main = "Prior N(6, 9)")
plot(ppnLike ~ theta, type = 'l', main = "Proportional likelihood")
plot(posterior ~ theta, type = 'l', main = "Posterior")
abline(v=c(unlist(ci)))



