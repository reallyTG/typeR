library(LambertW)


### Name: test_symmetry
### Title: Test symmetry based on Lambert W heavy tail(s)
### Aliases: test_symmetry
### Keywords: htest

### ** Examples



# skewed
yy <- rLambertW(n = 500, theta = list(delta = c(0.1, 0.25), beta = c(2, 1)), 
                distname = "normal")
fit.ml <- MLE_LambertW(yy, type = "hh", distname = "normal", 
                       hessian = TRUE)
summary(fit.ml)
test_symmetry(fit.ml, "LR")
test_symmetry(fit.ml, "Wald")

## Not run: 
##D # symmetric 
##D yy <- rLambertW(n = 500, theta = list(delta = c(0.2, 0.2), beta = c(2, 1)), 
##D                 distname = "normal")
##D fit.ml <- MLE_LambertW(yy, type = "hh", distname = "normal")
##D summary(fit.ml)
##D test_symmetry(fit.ml, "LR")
##D test_symmetry(fit.ml, "Wald")
## End(Not run)



