library(bayeslm)


### Name: plot.MCMC
### Title: Plot posterior summary
### Aliases: plot.MCMC
### Keywords: summary

### ** Examples

x = matrix(rnorm(1000), 100, 10)
y = x %*% rnorm(10) + rnorm(100)
fit=bayeslm(y~x)
plot(fit$beta)



