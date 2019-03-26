library(ROptEstOld)


### Name: infoPlot
### Title: Plot absolute and relative information
### Aliases: infoPlot
### Keywords: robust

### ** Examples

N <- NormLocationScaleFamily(mean=0, sd=1) 
IC1 <- optIC(model = N, risk = asCov())
infoPlot(IC1)



