library(robustlmm)


### Name: plot-methods
### Title: Plot an Object of the "Psi Function" Class
### Aliases: plot-methods plot,Rcpp_SmoothPsi-method
###   plot,Rcpp_HuberPsi-method plot,Rcpp_PsiFunction-method
###   plot,Rcpp_PsiFunctionToPropIIPsiFunctionWrapper-method
### Keywords: methods

### ** Examples

plot(huberPsiRcpp)
plot(huberPsiRcpp, which=c("psi", "Dpsi", "wgt"),
     main="short", leg = "topleft")

plot(smoothPsi)
## Plotting aspect ratio = 1:1 :
plot(smoothPsi, asp=1, main="short",
     which = c("psi", "Dpsi", "wgt", "Dwgt"))



