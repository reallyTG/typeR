library(unmarked)


### Name: nonparboot-methods
### Title: Nonparametric bootstrapping in unmarked
### Aliases: nonparboot nonparboot-methods nonparboot,unmarkedFit-method
###   nonparboot,unmarkedFitColExt-method nonparboot,unmarkedFitDS-method
###   nonparboot,unmarkedFitMPois-method nonparboot,unmarkedFitOccu-method
###   nonparboot,unmarkedFitOccuPEN-method
###   nonparboot,unmarkedFitOccuPEN_CV-method
###   nonparboot,unmarkedFitOccuRN-method
###   nonparboot,unmarkedFitPCount-method nonparboot,unmarkedFitGDS-method
###   nonparboot,unmarkedFitGMM-method nonparboot,unmarkedFitPCO-method
### Keywords: methods

### ** Examples

data(ovendata)
ovenFrame <- unmarkedFrameMPois(ovendata.list$data,
siteCovs=as.data.frame(scale(ovendata.list$covariates[,-1])), type = "removal")
(fm <- multinomPois(~ 1 ~ ufc + trba, ovenFrame))
fm <- nonparboot(fm, B = 20) # should use larger B in real life.
vcov(fm, method = "hessian")
vcov(fm, method = "nonparboot")
avg.abundance <- backTransform(linearComb(fm, type = "state", coefficients = c(1, 0, 0)))

## Bootstrap sample information propagates through to derived quantities.
vcov(avg.abundance, method = "hessian")
vcov(avg.abundance, method = "nonparboot")
SE(avg.abundance, method = "nonparboot")



