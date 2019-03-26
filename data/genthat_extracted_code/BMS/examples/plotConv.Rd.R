library(BMS)


### Name: plotConv
### Title: Plot Convergence of BMA Sampler
### Aliases: plotConv
### Keywords: aplot

### ** Examples


data(datafls)
mm=bms(datafls[,1:12],user.int=FALSE)

plotConv(mm)

#is similar to
matplot(pmp.bma(mm),type="l")




