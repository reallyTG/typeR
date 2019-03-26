library(VGAM)


### Name: gamma1
### Title: 1-parameter Gamma Distribution
### Aliases: gamma1
### Keywords: models regression

### ** Examples

gdata <- data.frame(y = rgamma(n = 100, shape = exp(3)))
fit <- vglm(y ~ 1, gamma1, data = gdata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



