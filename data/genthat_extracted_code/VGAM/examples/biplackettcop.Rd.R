library(VGAM)


### Name: biplackettcop
### Title: Plackett's Bivariate Copula Family Function
### Aliases: biplackettcop
### Keywords: models regression

### ** Examples

## Not run: 
##D ymat <- rbiplackcop(n = 2000, oratio = exp(2))
##D plot(ymat, col = "blue")
##D fit <- vglm(ymat ~ 1, fam = biplackettcop, trace = TRUE)
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D vcov(fit)
##D head(fitted(fit))
##D summary(fit)
## End(Not run)



