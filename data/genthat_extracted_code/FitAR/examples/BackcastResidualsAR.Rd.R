library(FitAR)


### Name: BackcastResidualsAR
### Title: Innovation Residuals in AR
### Aliases: BackcastResidualsAR
### Keywords: ts

### ** Examples

#compare residuals obtained using backcasting with fitted parameters and
# the residuals extracted from output of FitAR.  They are identical.
p<-11
out<-FitAR(log(lynx), p)
phi<-out$phiHat #fitted parameters
resphi<-BackcastResidualsAR(log(lynx), phi)
sum(abs(resphi-resid(out)))



