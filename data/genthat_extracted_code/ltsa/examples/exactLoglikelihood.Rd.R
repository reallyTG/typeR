library(ltsa)


### Name: exactLoglikelihood
### Title: Exact log-likelihood and MLE for variance
### Aliases: exactLoglikelihood
### Keywords: ts ~kwd2

### ** Examples

set.seed(7773311)
n <- 200
z <- arima.sim(model=list(ar=0.9, ma=-0.6), n=n, n.start=10^4)
out <- arima(z, order=c(1,0,1), include.mean=FALSE)
out
#note
#sigma^2 estimated as 0.9558:  log likelihood = -279.66,  aic = 565.31
r <- tacvfARMA(phi=coef(out)[1], theta=-coef(out)[2], maxLag=n-1)
exactLoglikelihood(r, z, innovationVarianceQ = TRUE)
#agrees!



