library(flexmix)


### Name: fitted-methods
### Title: Extract Model Fitted Values
### Aliases: fitted,flexmix-method fitted,FLXM-method fitted,FLXR-method
###   fitted,FLXRMRglm-method
### Keywords: methods

### ** Examples

data("NPreg", package = "flexmix")
ex1 <- flexmix(yn ~ x + I(x^2), data = NPreg, k = 2)
matplot(NPreg$x, fitted(ex1), pch = 16, type = "p")
points(NPreg$x, NPreg$yn)



