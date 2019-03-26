library(SpatialVx)


### Name: obs0426
### Title: Spatial Forecast Verification Methods Inter-Comparison Project
###   (ICP) Test Cases and other example verification sets
### Aliases: obs0426 obs0513 obs0514 obs0518 obs0519 obs0525 obs0601
###   obs0603 obs0604 wrf2caps0425 wrf2caps0512 wrf2caps0513 wrf2caps0517
###   wrf2caps0518 wrf2caps0524 wrf2caps0531 wrf2caps0602 wrf2caps0603
###   wrf4ncar0425 wrf4ncar0512 wrf4ncar0513 wrf4ncar0517 wrf4ncar0518
###   wrf4ncar0524 wrf4ncar0531 wrf4ncar0602 wrf4ncar0603 wrf4ncep0425
###   wrf4ncep0512 wrf4ncep0513 wrf4ncep0517 wrf4ncep0518 wrf4ncep0524
###   wrf4ncep0531 wrf4ncep0602 wrf4ncep0603 geom000 geom001 geom002
###   geom003 geom004 geom005 pert000 pert001 pert002 pert003 pert004
###   pert005 pert006 pert007 ICPg240Locs
### Keywords: datasets

### ** Examples

## Not run: 
##D data(obs0426)
##D data(wrf2caps0425)
##D data(wrf4ncar0425)
##D data(wrf4ncep0425)
##D data(ICPg240Locs)
##D ## Plot verification sets with a map.
##D ## Two different methods.
##D 
##D # First way does not preserve projections.
##D locr <- c( range( ICPg240Locs[,1]), range( ICPg240Locs[,2]))
##D zl <- range( c( c(obs0426), c( wrf2caps0425), c( wrf4ncar0425),
##D 		c( wrf4ncep0425)))
##D par( mfrow=c(2,2), mar=rep(0.1,4))
##D image( obs0426, axes=FALSE, col=c("grey", tim.colors(256)), zlim=zl)
##D par( usr=locr)
##D if( map.available) map( add=TRUE, database="state")
##D image( wrf2caps0425, axes=FALSE, col=c("grey", tim.colors(256)), zlim=zl)
##D par( usr=locr)
##D if( map.available) map( add=TRUE, database="state")
##D image( wrf4ncar0425, axes=FALSE, col=c("grey", tim.colors(256)), zlim=zl)
##D par( usr=locr)
##D if( map.available) map( add=TRUE, database="state")
##D image( wrf4ncep0425, axes=FALSE, col=c("grey", tim.colors(256)), zlim=zl)
##D par( usr=locr)
##D if( map.available) map( add=TRUE, database="state")
##D image.plot( obs0426, legend.only=TRUE, horizontal=TRUE, 
##D 		col=c("grey", tim.colors(256)), zlim=zl)
##D 
##D # Second way preserves projections, but values are slighlty interpolated.
##D zl <- range( c( c(obs0426), c( wrf2caps0425), c( wrf4ncar0425),
##D                 c( wrf4ncep0425)))
##D par( mfrow=c(2,2), mar=rep(2.1,4))
##D image(as.image(c(t(obs0426)), x=ICPg240Locs, nx=601, ny=501, na.rm=TRUE), zlim=zl,
##D         col=c("grey", tim.colors(64)), axes=FALSE, main="Stage II Reanalysis 4/26/05 0000 UTC")
##D map(add=TRUE, lwd=1.5)
##D map(add=TRUE, database="state", lty=2)
##D image(as.image(c(t(wrf2caps0425)), x=ICPg240Locs, nx=601, ny=501, na.rm=TRUE), zlim=zl,
##D 	col=c("grey", tim.colors(64)), axes=FALSE, main="WRF CAPS valid 4/26/05 0000 UTC")
##D map(add=TRUE, lwd=1.5)
##D map(add=TRUE, database="state", lty=2)
##D image(as.image(c(t(wrf4ncar0425)), x=ICPg240Locs, nx=601, ny=501, na.rm=TRUE), zlim=zl,
##D         col=c("grey", tim.colors(64)), axes=FALSE, main="WRF NCAR valid 4/26/05 0000 UTC")
##D map(add=TRUE, lwd=1.5)
##D map(add=TRUE, database="state", lty=2)
##D image(as.image(c(t(wrf4ncep0425)), x=ICPg240Locs, nx=601, ny=501, na.rm=TRUE), zlim=zl,
##D         col=c("grey", tim.colors(64)), axes=FALSE, main="WRF NCEP valid 4/26/05 0000 UTC")
##D map(add=TRUE, lwd=1.5)
##D map(add=TRUE, database="state", lty=2)
##D image.plot(obs0426, col=c("grey", tim.colors(64)), zlim=zl, legend.only=TRUE, horizontal=TRUE)
## End(Not run)



