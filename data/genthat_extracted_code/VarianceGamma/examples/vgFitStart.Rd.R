library(VarianceGamma)


### Name: vgFitStart
### Title: Find Starting Values for Fitting a Variance Gamma Distribution
### Aliases: vgFitStart vgFitStartMoM

### ** Examples

param <- c(0,0.5,0,0.5)
dataVector <- rvg(500, param = param)
vgFitStart(dataVector,startValues="SL")
vgFitStartMoM(dataVector)
vgFitStart(dataVector,startValues="MoM")



