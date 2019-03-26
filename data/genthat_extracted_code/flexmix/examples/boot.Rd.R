library(flexmix)


### Name: boot
### Title: Bootstrap a flexmix Object
### Aliases: boot boot,flexmix-method LR_test LR_test,flexmix-method
###   boot,flexmix-method show,FLXboot-method FLXboot-class
###   plot,FLXboot,missing-method parameters,FLXboot-method
###   clusters,FLXboot,listOrdata.frame-method predict,FLXboot-method
###   posterior,FLXboot,listOrdata.frame-method
### Keywords: methods

### ** Examples

data("NPreg", package = "flexmix")
fitted <- initFlexmix(yn ~ x + I(x^2) | id2, data = NPreg, k = 2)
## Not run: 
##D lrtest <- LR_test(fitted, alternative = "greater", R = 20,
##D                   verbose = 1)
## End(Not run)



