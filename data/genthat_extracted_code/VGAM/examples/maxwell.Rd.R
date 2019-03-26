library(VGAM)


### Name: maxwell
### Title: Maxwell Distribution Family Function
### Aliases: maxwell
### Keywords: models regression

### ** Examples

mdata <- data.frame(y = rmaxwell(1000, rate = exp(2)))
fit <- vglm(y ~ 1, maxwell, data = mdata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)



