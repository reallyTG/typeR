library(model4you)


### Name: pmtest
### Title: Test if personalised models improve upon base model.
### Aliases: pmtest plot.heterogeneity_test

### ** Examples

## Not run: 
##D set.seed(123)
##D n <- 160
##D trt <- factor(rep(0:1, each = n/2))
##D y <- 4 + (trt == 1) + rnorm(n)
##D z <- matrix(rnorm(n * 2), ncol = 2)
##D 
##D dat <- data.frame(y, trt, z)
##D 
##D mod <- lm(y ~ trt, data = dat)
##D 
##D ## Note that ntree should usually be higher
##D frst <- pmforest(mod, ntree = 20) 
##D pmods <- pmodel(frst, fun = identity)
##D 
##D ## Note that B should be at least 100
##D ## The low B is just for demonstration 
##D ## purposes.
##D tst <- pmtest(forest = frst, 
##D               pmodels = pmods, 
##D               B = 10) 
##D tst$pvalue
##D tst
##D plot(tst)
## End(Not run)




