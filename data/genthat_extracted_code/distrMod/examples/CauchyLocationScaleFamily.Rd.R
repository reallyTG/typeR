library(distrMod)


### Name: CauchyLocationScaleFamily
### Title: Generating function for Cauchy location and scale families
### Aliases: CauchyLocationScaleFamily
### Keywords: models

### ** Examples

(C1 <- CauchyLocationScaleFamily())
plot(C1)
FisherInfo(C1)
### need smaller integration range:
distrExoptions("ElowerTruncQuantile"=1e-4,"EupperTruncQuantile"=1e-4)
checkL2deriv(C1)
distrExoptions("ElowerTruncQuantile"=1e-7,"EupperTruncQuantile"=1e-7)



