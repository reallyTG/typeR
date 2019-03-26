library(regsem)


### Name: multi_optim
### Title: Multiple starts for Regularized Structural Equation Modeling
### Aliases: multi_optim
### Keywords: multiple optim

### ** Examples

## Not run: 
##D # Note that this is not currently recommended. Use cv_regsem() instead
##D library(regsem)
##D # put variables on same scale for regsem
##D HS <- data.frame(scale(HolzingerSwineford1939[ ,7:15]))
##D mod <- '
##D f =~ x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9
##D '
##D outt = cfa(mod, HS, meanstructure=TRUE)
##D 
##D fit1 <- multi_optim(outt, max.try=40,
##D                    lambda=0.1, type="lasso")
##D 
##D 
##D # growth model
##D model <- ' i =~ 1*t1 + 1*t2 + 1*t3 + 1*t4
##D           s =~ 0*t1 + s1*t2 + s2*t3 + 3*t4 '
##D fit <- growth(model, data=Demo.growth)
##D summary(fit)
##D fitmeasures(fit)
##D fit3 <- multi_optim(fit, lambda=0.2, type="lasso")
##D summary(fit3)
## End(Not run)



