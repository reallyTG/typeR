library(VGAM)


### Name: Inv.lomax
### Title: The Inverse Lomax Distribution
### Aliases: Inv.lomax dinv.lomax pinv.lomax qinv.lomax rinv.lomax
### Keywords: distribution

### ** Examples

idata <- data.frame(y = rinv.lomax(n = 1000, exp(2), exp(1)))
fit <- vglm(y ~ 1, inv.lomax, data = idata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)



