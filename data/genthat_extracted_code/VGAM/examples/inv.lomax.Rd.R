library(VGAM)


### Name: inv.lomax
### Title: Inverse Lomax Distribution Family Function
### Aliases: inv.lomax
### Keywords: models regression

### ** Examples

idata <- data.frame(y = rinv.lomax(n = 2000, scale = exp(2), exp(1)))
fit <- vglm(y ~ 1, inv.lomax, data = idata, trace = TRUE)
fit <- vglm(y ~ 1, inv.lomax(iscale = exp(3)), data = idata,
            trace = TRUE, epsilon = 1e-8, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)
summary(fit)



