library(VGAM)


### Name: waldff
### Title: Wald Distribution Family Function
### Aliases: waldff
### Keywords: models regression

### ** Examples

wdata <- data.frame(y = rinv.gaussian(n = 1000, mu =  1, lambda = exp(1)))
wfit <- vglm(y ~ 1, waldff(ilambda = 0.2), data = wdata, trace = TRUE)
coef(wfit, matrix = TRUE)
Coef(wfit)
summary(wfit)



