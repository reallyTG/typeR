library(VGAM)


### Name: inv.paralogistic
### Title: Inverse Paralogistic Distribution Family Function
### Aliases: inv.paralogistic
### Keywords: models regression

### ** Examples

idata <- data.frame(y = rinv.paralogistic(n = 3000, exp(1), scale = exp(2)))
fit <- vglm(y ~ 1, inv.paralogistic(lss = FALSE), data = idata, trace = TRUE)
fit <- vglm(y ~ 1, inv.paralogistic(imethod = 2, ishape1.a = 4),
            data = idata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



