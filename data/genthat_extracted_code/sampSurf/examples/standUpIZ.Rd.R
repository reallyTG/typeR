library(sampSurf)


### Name: standUpIZ
### Title: Generate Objects of Class "'standUpIZ'"
### Aliases: standUpIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=40, solidType=4, logAngle=4*pi/3, logLen=6)
iz.su = standUpIZ(dl, 5)
summary(iz.su)
plot(iz.su, axes=TRUE, showPlotCenter=TRUE, cex=2, showNeedle=TRUE)



