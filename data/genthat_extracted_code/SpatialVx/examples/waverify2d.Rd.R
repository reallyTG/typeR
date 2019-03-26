library(SpatialVx)


### Name: waverify2d
### Title: High-Resolution Gridded Forecast Verification Using Discrete
###   Wavelet Decomposition
### Aliases: waverify2d waverify2d.default waverify2d.SpatialVx
###   mowaverify2d mowaverify2d.default mowaverify2d.SpatialVx
###   plot.waverify2d print.waverify2d
### Keywords: math

### ** Examples

grid<- list( x= seq( 0,5,,64), y= seq(0,5,,64))
obj<-Exp.image.cov( grid=grid, theta=.5, setup=TRUE)
look<- sim.rf( obj) 
look[ look < 0] <- 0
look <- zapsmall( look)

look2 <- sim.rf( obj) 
look2[ look2 < 0] <- 0 
look2 <- zapsmall( look2)

res <- waverify2d(look, Y=look2)
plot(res)
summary(res)

## Not run: 
##D data( "UKobs6" )
##D data( "UKfcst6" )
##D 
##D look <- waverify2d(UKobs6, Y=UKfcst6)
##D 
##D plot(look, which.plots="energy")
##D look2 <- mowaverify2d(UKobs6, UKfcst6, J=8)
##D plot(look2, which.plots="energy")
##D 
##D plot(look, main1="NIMROD Analysis", main2="NIMROD Forecast")
##D 
##D plot(look2, main1="NIMROD Analysis", main2="NIMROD Forecast")
##D 
##D # Alternative using "SpatialVx" object.
##D data( "UKloc" )
##D 
##D hold <- make.SpatialVx( UKobs6, UKfcst6, loc = UKloc,
##D     map = TRUE, field.type = "Rainfall", units = "mm/h",
##D     data.name = "Nimrod", obs.name = "Obs 6",
##D     model.name = "Fcst 6" )
##D 
##D look <- waverify2d(hold)
##D 
##D plot(look, which.plots="details")
##D 
##D data( "pert000" )
##D data( "pert004" )
##D 
##D # The following is slow, but does not require fields to be dyadic.
##D look <- mowaverify2d(pert000, Y=pert004, J=8, verbose=TRUE)
##D 
##D # Also can just do plot(look), but should print to a pdf file (e.g., using pdf()).
##D plot(look, which.plots="energy")
##D 
##D # Using a "SpatialVx" object.
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, pert004, loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D look <- mowaverify2d( hold, verbose = TRUE )
##D 
##D plot(look, which.plots = "details")
##D 
##D # Try one with some kind of climatology field.  Here using surrogater2d function.
##D hold <- surrogater2d(UKobs6, n=1, maxiter=50, verbose=TRUE)
##D hold <- matrix(hold, 256, 256)
##D image(hold, col=c("grey",tim.colors(64)), axes=FALSE)
##D image.plot(UKloc, col=c("grey",tim.colors(64)), legend.only=TRUE, horizontal=TRUE)
##D 
##D look <- waverify2d(UKobs6, Y=UKfcst6, Clim=hold)
##D 
##D plot(look)
##D 
## End(Not run)



