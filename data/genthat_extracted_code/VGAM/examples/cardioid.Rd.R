library(VGAM)


### Name: cardioid
### Title: Cardioid Distribution Family Function
### Aliases: cardioid
### Keywords: models regression

### ** Examples

## Not run: 
##D cdata <- data.frame(y = rcard(n = 1000, mu = 4, rho = 0.45))
##D fit <- vglm(y ~ 1, cardioid, data = cdata, trace = TRUE)
##D coef(fit, matrix=TRUE)
##D Coef(fit)
##D c(with(cdata, mean(y)), head(fitted(fit), 1))
##D summary(fit)
## End(Not run)



