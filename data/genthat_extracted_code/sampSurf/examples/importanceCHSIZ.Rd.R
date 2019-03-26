library(sampSurf)


### Name: importanceCHSIZ
### Title: Generate Objects of Class "'importanceCHSIZ'"
### Aliases: importanceCHSIZ
### Keywords: ~kwd1 ~kwd2

### ** Examples

st = standingTree(dbh=50, solidType=4, height=25)
ag = angleGauge(baf=4)
iz.ichs = importanceCHSIZ(st, ag)
summary(iz.ichs)
plot(iz.ichs, axes=TRUE, cex=2)



