library(VGAM)


### Name: slash
### Title: Slash Distribution Family Function
### Aliases: slash
### Keywords: models regression

### ** Examples

## Not run: 
##D sdata <- data.frame(y = rslash(n = 1000, mu = 4, sigma = exp(2)))
##D fit <- vglm(y ~ 1, slash, data = sdata, trace = TRUE)
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D summary(fit)
## End(Not run)



