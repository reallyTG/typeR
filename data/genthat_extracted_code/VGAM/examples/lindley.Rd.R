library(VGAM)


### Name: lindley
### Title: 1-parameter Gamma Distribution
### Aliases: lindley
### Keywords: models regression

### ** Examples

ldata <- data.frame(y = rlind(n = 1000, theta = exp(3)))
fit <- vglm(y ~ 1, lindley, data = ldata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



