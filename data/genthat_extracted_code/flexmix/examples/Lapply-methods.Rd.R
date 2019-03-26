library(flexmix)


### Name: Lapply-methods
### Title: Methods for Function Lapply
### Aliases: Lapply,FLXRmstep-method
### Keywords: methods

### ** Examples

data("NPreg", package = "flexmix")
ex2 <- flexmix(yn ~ x, data = NPreg, k = 2, model = list(FLXMRglm(yn ~ 
    . + I(x^2)), FLXMRglm(yp ~ ., family = "poisson")))
ex2r <- refit(ex2, method = "mstep")
Lapply(ex2r, "vcov", 2)



