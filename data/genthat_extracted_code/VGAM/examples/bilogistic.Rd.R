library(VGAM)


### Name: bilogistic
### Title: Bivariate Logistic Distribution Family Function
### Aliases: bilogistic
### Keywords: models regression

### ** Examples

## Not run: 
##D ymat <- rbilogis(n <- 50, loc1 = 5, loc2 = 7, scale2 = exp(1))
##D plot(ymat)
##D bfit <- vglm(ymat ~ 1, family = bilogistic, trace = TRUE)
##D coef(bfit, matrix = TRUE)
##D Coef(bfit)
##D head(fitted(bfit))
##D vcov(bfit)
##D head(weights(bfit, type = "work"))
##D summary(bfit)
## End(Not run)



