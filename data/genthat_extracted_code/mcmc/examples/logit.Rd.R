library(mcmc)


### Name: logit
### Title: Simulated logistic regression data.
### Aliases: logit
### Keywords: datasets

### ** Examples

library(mcmc)
data(logit)
out <- glm(y ~ x1 + x2 + x3 + x4, family = binomial, data = logit)
summary(out)



