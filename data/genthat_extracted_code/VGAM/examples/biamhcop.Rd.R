library(VGAM)


### Name: biamhcop
### Title: Ali-Mikhail-Haq Distribution Family Function
### Aliases: biamhcop
### Keywords: models regression

### ** Examples

ymat <- rbiamhcop(1000, apar = rhobit(2, inverse = TRUE))
fit <- vglm(ymat ~ 1, biamhcop, trace = TRUE)
coef(fit, matrix = TRUE)
Coef(fit)



