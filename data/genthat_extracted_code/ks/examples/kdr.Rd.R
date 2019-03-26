library(ks)


### Name: kdr
### Title: Kernel density ridge estimation
### Aliases: kdr
### Keywords: cluster

### ** Examples

## No test: 
library(maps)
data(quake) 
quake <- quake[quake$prof==1,]  ## Pacific Ring of Fire 
quake$long[quake$long<0] <- quake$long[quake$long<0] + 360
quake <- quake[, c("long", "lat")]
data(plate)                     ## tectonic plate boundaries
plate <- plate[plate$long < -20 | plate$long > 20,]
plate$long[plate$long<0 & !is.na(plate$long)] <- plate$long[plate$long<0
& !is.na(plate$long)] + 360

dr.quake <- kdr(x=quake, xmin=c(70,-70), xmax=c(310, 80))
map("world2", xlim=c(85, 305), ylim=c(-70, 70), mar=c(0,0,0,0), interior=FALSE, lty=2)
lines(plate[,1:2], col=3, lwd=2)
points(dr.quake$end.points, cex=0.5, pch=16, col=2)
## End(No test)



