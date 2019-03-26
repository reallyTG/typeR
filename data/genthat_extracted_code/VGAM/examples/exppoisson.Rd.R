library(VGAM)


### Name: exppoisson
### Title: Exponential Poisson Distribution Family Function
### Aliases: exppoisson
### Keywords: models regression

### ** Examples

## Not run: 
##D shape <- exp(1); rate <- exp(2)
##D rdata <- data.frame(y = rexppois(n = 1000, rate = rate, shape = shape))
##D library("hypergeo")  # Required!
##D fit <- vglm(y ~ 1, exppoisson, data = rdata, trace = FALSE, maxit = 1200)
##D c(with(rdata, median(y)), head(fitted(fit), 1))
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D summary(fit)
## End(Not run)



