library(VGAM)


### Name: Inv.paralogistic
### Title: The Inverse Paralogistic Distribution
### Aliases: Inv.paralogistic dinv.paralogistic pinv.paralogistic
###   qinv.paralogistic rinv.paralogistic
### Keywords: distribution

### ** Examples

idata <- data.frame(y = rinv.paralogistic(n = 3000, exp(1), scale = exp(2)))
fit <- vglm(y ~ 1, inv.paralogistic(lss = FALSE, ishape1.a = 2.1),
            data = idata, trace = TRUE, crit = "coef")
coef(fit, matrix = TRUE)
Coef(fit)



