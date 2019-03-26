library(sampSurf)


### Name: horizontalPointIZ
### Title: Generate Objects of Class "'horizontalPointIZ'"
### Aliases: horizontalPointIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
iz.hps = horizontalPointIZ(st, ag)
summary(iz.hps)
plot(iz.hps, axes=TRUE, cex=2)



