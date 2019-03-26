library(mcmc)


### Name: foo
### Title: Simulated logistic regression data.
### Aliases: foo
### Keywords: datasets

### ** Examples

library(mcmc)
data(foo)
out <- glm(y ~ x1 + x2 + x3, family = binomial, data = foo)
summary(out)



