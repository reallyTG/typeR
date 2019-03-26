library(RefFreeEWAS)


### Name: RefFreeEwasModel
### Title: Reference-Free EWAS Model
### Aliases: RefFreeEwasModel
### Keywords: deconvolution DNA methylation EWAS surrogate variable cell
###   mixture svd

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




