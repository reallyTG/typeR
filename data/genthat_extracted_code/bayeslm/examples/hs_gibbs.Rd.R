library(bayeslm)


### Name: hs_gibbs
### Title: Gibbs sampler of horseshoe regression
### Aliases: hs_gibbs
### Keywords: univar

### ** Examples

x = matrix(rnorm(1000), 100, 10)
y = x %*% rnorm(10) + rnorm(100)
fit=hs_gibbs(y, x, 1000, 1, 1, TRUE)
summary(fit)



