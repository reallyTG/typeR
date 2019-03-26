library(sampSurf)


### Name: pointRelascopeIZ
### Title: Generate Objects of Class "'pointRelascopeIZ'"
### Aliases: pointRelascopeIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=15, solidType=4, logAngle=pi/3, logLen=10, units='English')
(angle = .StemEnv$rad2Deg(2*atan(1/4)))
prs = pointRelascope(angle, units='English')
iz.prs = pointRelascopeIZ(dl, prs=prs)
summary(iz.prs)
plot(iz.prs, axes=TRUE, showDualCenters=TRUE, cex=2, showNeedle=TRUE)



