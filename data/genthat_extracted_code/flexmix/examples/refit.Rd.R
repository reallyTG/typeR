library(flexmix)


### Name: refit-methods
### Title: Refit a Fitted Model
### Aliases: refit,flexmix-method FLXRmstep-class FLXRoptim-class
###   show,FLXR-method show,Coefmat-method summary,FLXRoptim-method
###   summary,FLXRmstep-method plot,FLXRoptim,missing-method
### Keywords: methods

### ** Examples


data("NPreg", package = "flexmix")
ex1 <- flexmix(yn ~ x + I(x^2), data = NPreg, k = 2)
ex1r <- refit(ex1)

## in one component all coefficients should be highly significant,
## in the other component only the linear term
summary(ex1r)



