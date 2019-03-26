library(VGAM)


### Name: bifgmcop
### Title: Farlie-Gumbel-Morgenstern's Bivariate Distribution Family
###   Function
### Aliases: bifgmcop
### Keywords: models regression

### ** Examples

ymat <- rbifgmcop(n = 1000, apar = rhobit(3, inverse = TRUE))
## Not run: plot(ymat, col = "blue")
fit <- vglm(ymat ~ 1, fam = bifgmcop, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)
head(fitted(fit))



