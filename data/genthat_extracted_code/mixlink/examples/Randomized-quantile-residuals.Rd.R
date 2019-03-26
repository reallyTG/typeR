library(mixlink)


### Name: Randomized quantile residuals
### Title: Randomized quantile residuals for Mixture Link
### Aliases: 'Randomized quantile residuals' 'Randomized quantile
###   residuals' rqres.mixlink.binom 'Randomized quantile residuals'
###   rqres.mixlink.pois

### ** Examples

n <- 400
mean.true <- rep(20, n)
Pi.true <- c(1/4, 3/4)
kappa.true <- 1.5
y <- r.mixlink.pois(n, mean.true, Pi.true, kappa.true)
r <- rqres.mixlink.pois(y, mean.true, Pi.true, kappa.true)
qqnorm(r); qqline(r)




