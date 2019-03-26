library(sampSurf)


### Name: pairedAICHSIZ
### Title: Generate Objects of Class "'pairedAICHSIZ'"
### Aliases: pairedAICHSIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
iz.paichs = pairedAICHSIZ(st, ag)
summary(iz.paichs)
plot(iz.paichs, axes=TRUE, cex=2)



