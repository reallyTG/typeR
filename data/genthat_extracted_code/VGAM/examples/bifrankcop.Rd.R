library(VGAM)


### Name: bifrankcop
### Title: Frank's Bivariate Distribution Family Function
### Aliases: bifrankcop
### Keywords: models regression

### ** Examples

## Not run: 
##D ymat <- rbifrankcop(n = 2000, apar = exp(4))
##D plot(ymat, col = "blue")
##D fit <- vglm(ymat ~ 1, fam = bifrankcop, trace = TRUE)
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D vcov(fit)
##D head(fitted(fit))
##D summary(fit)
## End(Not run)



