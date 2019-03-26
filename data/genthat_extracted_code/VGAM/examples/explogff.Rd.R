library(VGAM)


### Name: explogff
### Title: Exponential Logarithmic Distribution Family Function
### Aliases: explogff
### Keywords: models regression

### ** Examples

## Not run: 
##D  Scale <- exp(2); shape <- logit(-1, inverse = TRUE)
##D edata <- data.frame(y = rexplog(n = 2000, scale = Scale, shape = shape))
##D fit <- vglm(y ~ 1, explogff, data = edata, trace = TRUE)
##D c(with(edata, median(y)), head(fitted(fit), 1))
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D summary(fit)
## End(Not run)



