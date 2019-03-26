library(bayeslm)


### Name: summary.MCMC
### Title: Summarize posterior draws
### Aliases: summary.MCMC
### Keywords: sumamry

### ** Examples

x = matrix(rnorm(1000), 100, 10)
y = x %*% rnorm(10) + rnorm(100)
fit=bayeslm(y~x)
summary(fit$beta)



