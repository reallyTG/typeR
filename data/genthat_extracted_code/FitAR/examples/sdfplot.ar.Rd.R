library(FitAR)


### Name: sdfplot.ar
### Title: Autoregressive Spectral Density Estimation for "ar"
### Aliases: sdfplot.ar
### Keywords: ts

### ** Examples

#Fit AR(p) using AIC model selection and Burg estimates. Plot spectral density
#estimate
ans<-ar(lynx, lag.max=20)
sdfplot(ans)



