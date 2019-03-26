library(VGAM)


### Name: gev
### Title: Generalized Extreme Value Distribution Family Function
### Aliases: gev gevff
### Keywords: models regression

### ** Examples

## Not run: 
##D # Multivariate example
##D fit1 <- vgam(cbind(r1, r2) ~ s(year, df = 3), gev(zero = 2:3),
##D              data = venice, trace = TRUE)
##D coef(fit1, matrix = TRUE)
##D head(fitted(fit1))
##D par(mfrow = c(1, 2), las = 1)
##D plot(fit1, se = TRUE, lcol = "blue", scol = "forestgreen",
##D      main = "Fitted mu(year) function (centered)", cex.main = 0.8)
##D with(venice, matplot(year, depvar(fit1)[, 1:2], ylab = "Sea level (cm)",
##D      col = 1:2, main = "Highest 2 annual sea levels", cex.main = 0.8))
##D with(venice, lines(year, fitted(fit1)[,1], lty = "dashed", col = "blue"))
##D legend("topleft", lty = "dashed", col = "blue", "Fitted 95 percentile")
##D 
##D # Univariate example
##D (fit <- vglm(maxtemp ~ 1, gevff, data = oxtemp, trace = TRUE))
##D head(fitted(fit))
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D vcov(fit)
##D vcov(fit, untransform = TRUE)
##D sqrt(diag(vcov(fit)))  # Approximate standard errors
##D rlplot(fit)
## End(Not run)



