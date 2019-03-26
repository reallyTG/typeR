library(gamclass)


### Name: CVgam
### Title: Cross-validation estimate of accuracy from GAM model fit
### Aliases: CVgam
### Keywords: models regression

### ** Examples

if(require(sp)){
library(mgcv)
data(meuse)
meuse$ffreq <- factor(meuse$ffreq)
CVgam(formula=log(zinc)~s(elev) + s(dist) + ffreq + soil,
              data = meuse, nfold = 10, debug.level = 0, method = "GCV.Cp",
              printit = TRUE, cvparts = NULL, gamma = 1, seed = 29)
}



