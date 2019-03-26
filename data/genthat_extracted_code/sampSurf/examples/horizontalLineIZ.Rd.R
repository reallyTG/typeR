library(sampSurf)


### Name: horizontalLineIZ
### Title: Generate Objects of Class "'horizontalLineIZ'"
### Aliases: horizontalLineIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

st = standingTree(dbh=25, solidType=2.5, height=15) #metric
ag = angleGauge(baf=4) #metric
hls.iz = horizontalLineIZ(st, angleGauge=ag, lineLength=50, orientation=345)
summary(hls.iz)
plot(hls.iz, axes=TRUE, cex=2)



