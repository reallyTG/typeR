library(VGAM)


### Name: riceff
### Title: Rice Distribution Family Function
### Aliases: riceff
### Keywords: models regression

### ** Examples

## Not run: 
##D  sigma <- exp(1); vee <- exp(2)
##D rdata <- data.frame(y = rrice(n <- 1000, sigma, vee = vee))
##D fit <- vglm(y ~ 1, riceff, data = rdata, trace = TRUE, crit = "coef")
##D c(with(rdata, mean(y)), fitted(fit)[1])
##D coef(fit, matrix = TRUE)
##D Coef(fit)
##D summary(fit)
## End(Not run)



