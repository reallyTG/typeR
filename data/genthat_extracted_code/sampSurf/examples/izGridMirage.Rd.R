library(sampSurf)


### Name: izGridMirage
### Title: Generate Objects of Class "'mirageInclusionZoneGrid'"
### Aliases: izGridMirage
### Keywords: ~kwd1 ~kwd2

### ** Examples
 
tr = Tract(c(x=20,y=20), cellSize=1)
mtr = mirageTract(tr)
st = standingTree(centerOffset=c(x=16,y=16))
ag = angleGauge(4)     #4=baf
hps.iz = horizontalPointIZ(st, angleGauge=ag)
hps.izg = izGridMirage(hps.iz, mtr, truncateOverlap=FALSE)
plot(hps.izg, tract=mtr)
#now show external grid estimates...
plot(hps.izg, tract=mtr, showExtended = TRUE)



