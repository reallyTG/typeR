library(sampSurf)


### Name: fullChainSawIZ
### Title: Generate Objects of Class "'fullChainSawIZ'"
### Aliases: fullChainSawIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=40, solidType=4, logAngle=4*pi/3, logLen=6)
iz.fcs = fullChainSawIZ(dl, plotRadius=3)
summary(iz.fcs)
plot(iz.fcs, axes=TRUE, showPlotCenter=TRUE, cex=2, showNeedle=TRUE)



