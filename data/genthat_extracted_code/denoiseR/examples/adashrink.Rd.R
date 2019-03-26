library(denoiseR)


### Name: adashrink
### Title: Adaptive Shrinkage
### Aliases: adashrink

### ** Examples

Xsim <- LRsim(200, 500, 100, 1)
## Not run: 
##D ada.gsure <- adashrink(Xsim$X, method = "GSURE")
##D ada.gsure$nb.eigen
##D ada.gsure$singval
##D ada.gsure$lambda
##D ada.gsure$gamma
##D 
##D Xsim <- LRsim(200, 500, 10, 4)
##D sig <- estim_sigma(Xsim$X)
##D ada.sure <- adashrink(Xsim$X, method = "SURE", sigma = sig)
##D soft.sure <- adashrink(Xsim$X, gamma.seq  = 1, method = "SURE", sigma = sig)
## End(Not run)



