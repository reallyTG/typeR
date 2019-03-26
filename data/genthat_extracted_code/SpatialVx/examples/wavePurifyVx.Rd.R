library(SpatialVx)


### Name: wavePurifyVx
### Title: Apply Traditional Forecast Verification After Wavelet Denoising
### Aliases: wavePurifyVx wavePurifyVx.default wavePurifyVx.SpatialVx
###   plot.wavePurifyVx summary.wavePurifyVx
### Keywords: math

### ** Examples

grid <- list( x= seq( 0,5,,100), y= seq(0,5,,100))
obj <- Exp.image.cov( grid=grid, theta=.5, setup=TRUE)
look <- sim.rf( obj)
look[ look < 0] <- 0
look <- zapsmall( look)
     
look2 <- sim.rf( obj)
look2[ look2 < 0] <- 0
look2 <- zapsmall( look2)

look3 <- sim.rf( obj) 
look3[ look3 < 0] <- 0 
look3 <- zapsmall( look3)

hold <- make.SpatialVx( look, look2, thresholds = c(0.1, 1),
            field.type = "random", units = "units")

plot( hold )

res <- wavePurifyVx( hold, climate = look3, return.fields = TRUE, verbose = TRUE )

plot(res, type="fields")
plot(res, type="stats")

summary(res)

## Not run: 
##D data( "UKobs6" )
##D data( "UKfcst6" )
##D data( "UKloc" )
##D 
##D hold <- surrogater2d( UKobs6, n=1, maxiter=50, verbose=TRUE)
##D hold <- matrix(hold, 256, 256)
##D 
##D UKobj <- make.SpatialVx( UKobs6, UKfcst6, thresholds = c(0.1, 2, 5, 10),
##D     loc = UKloc, map = TRUE, field.type = "Rainfall", units = "mm/h",
##D     data.name = "Nimrod", obs.name = "obs 6", model.name = "fcst 6" )
##D 
##D plot(UKobj ) 
##D 
##D look <- wavePurifyVx( object = UKobj, climate = hold,
##D     return.fields = TRUE, verbose = TRUE)
##D 
##D plot(look, type = "fields" )
##D plot(look, type = "stats" )
##D 
##D summary( look )
##D 
##D data( "pert004" )
##D data( "pert000" ) 
##D 
##D hold <- make.SpatialVx( pert000, pert004, thresholds = c(1, 10, 50),
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Perturbed ICP Cases", obs.name = "pert000",
##D     model.name = "pert004" )
##D 
##D plot( hold )
##D 
##D look <- wavePurifyVx( hold, return.fields = TRUE, verbose = TRUE )
##D 
##D plot(look, type = "fields" )
##D plot(look, type = "stats" )
##D 
##D summary( look )
## End(Not run)




