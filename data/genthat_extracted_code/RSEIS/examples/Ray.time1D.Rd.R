library(RSEIS)


### Name: Ray.time1D
### Title: Seismic 1D Travel Time and raypath
### Aliases: Ray.time1D
### Keywords: misc

### ** Examples



data(VELMOD1D)

v <-  VELMOD1D
indelta=23.;
 inhpz=7.;
 instaz=0.;
nz = length(v$zp)

tees  <-  travel.time1D(indelta, inhpz, instaz, nz , v$zp , v$vp)
rays  <-  Ray.time1D(indelta, inhpz, instaz, nz , v$zp , v$vp)



plot(rays$rnod[1:rays$nnod] , -rays$znod[1:rays$nnod],type="n",
 xlab="distance, km" , ylab="Depth, km")

abline(h=-v$zp, lty=2, col=grey(0.80) )
points(rays$rnod[1:rays$nnod] , -rays$znod[1:rays$nnod], pch=8, col='green')
lines(rays$rnod[1:rays$nnod] , -rays$znod[1:rays$nnod])
points(rays$rnod[rays$nnod] , -rays$znod[rays$nnod], pch=6, col='red', cex=2)
#####  to coordinate this in space, need to rotate about
#####    the line between source and receiver locations




