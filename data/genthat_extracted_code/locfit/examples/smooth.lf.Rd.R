library(locfit)


### Name: smooth.lf
### Title: Local Regression, Likelihood and Density Estimation.
### Aliases: smooth.lf
### Keywords: smooth

### ** Examples

# using smooth.lf() to fit a local likelihood model.
data(morths)
fit <- smooth.lf(morths$age, morths$deaths, weights=morths$n,
                 family="binomial")
plot(fit,type="l")

# update with the direct fit
fit1 <- update(fit, direct=TRUE)
lines(fit1,col=2)
print(max(abs(fit$y-fit1$y)))



