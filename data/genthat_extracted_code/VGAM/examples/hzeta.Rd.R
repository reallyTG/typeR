library(VGAM)


### Name: hzeta
### Title: Haight's Zeta Family Function
### Aliases: hzeta
### Keywords: models regression

### ** Examples

shape <- exp(exp(-0.1))  # The parameter
hdata <- data.frame(y = rhzeta(n = 1000, shape))
fit <- vglm(y ~ 1, hzeta, data = hdata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)  # Useful for intercept-only models; should be same as shape
c(with(hdata, mean(y)), head(fitted(fit), 1))
summary(fit)



