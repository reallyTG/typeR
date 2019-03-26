library(RFLPtools)


### Name: RFLPlod
### Title: Remove bands below LOD
### Aliases: RFLPlod
### Keywords: manip

### ** Examples

data(RFLPdata)
## remove bands with MW smaller than 60
RFLPdata.lod <- RFLPlod(RFLPdata, LOD = 60)
par(mfrow = c(1, 2))
RFLPplot(RFLPdata, nrBands = 4, ylim = c(40, 670))
RFLPplot(RFLPdata.lod, nrBands = 4, ylim = c(40, 670))
title(sub = "After applying RFLPlod")



