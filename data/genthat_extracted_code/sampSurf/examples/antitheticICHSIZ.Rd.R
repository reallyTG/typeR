library(sampSurf)


### Name: antitheticICHSIZ
### Title: Generate Objects of Class "'antitheticICHSIZ'"
### Aliases: antitheticICHSIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
iz.aichs = antitheticICHSIZ(st, ag)
summary(iz.aichs)
plot(iz.aichs, axes=TRUE, cex=2)



