library(RefFreeEWAS)


### Name: BootRefFreeEwasModel
### Title: Bootstrap for Reference-Free EWAS Model
### Aliases: BootRefFreeEwasModel
### Keywords: deconvolution DNA methylation EWAS surrogate variable cell
###   mixture bootstrap

### ** Examples


data(RefFreeEWAS)

## Not run: 
##D   tmpDesign <- cbind(1, rfEwasExampleCovariate)
##D   tmpBstar <- (rfEwasExampleBetaValues ##D 
##D 
##D   EstDimRMT(rfEwasExampleBetaValues-tmpBstar ##D 
## End(Not run)

test <- RefFreeEwasModel(
  rfEwasExampleBetaValues,
  cbind(1,rfEwasExampleCovariate),
  4)

testBoot <- BootRefFreeEwasModel(test,10)
summary(testBoot)




