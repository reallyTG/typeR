library(VGAM)


### Name: expgeometric
### Title: Exponential Geometric Distribution Family Function
### Aliases: expgeometric
### Keywords: models regression

### ** Examples

## Not run: 
##D Scale <- exp(2); shape = logit(-1, inverse = TRUE);
##D edata <- data.frame(y = rexpgeom(n = 2000, scale = Scale, shape = shape))
##D fit <- vglm(y ~ 1, expgeometric, edata, trace = TRUE)
##D c(with(edata, mean(y)), head(fitted(fit), 1))
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D summary(fit)
## End(Not run)



