library(sampSurf)


### Name: criticalHeightIZ
### Title: Generate Objects of Class "'criticalHeightIZ'"
### Aliases: criticalHeightIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
iz.chs = criticalHeightIZ(st, ag)
summary(iz.chs)
plot(iz.chs, axes=TRUE, cex=2)



