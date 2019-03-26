library(SpatialVx)


### Name: lossdiff
### Title: Test for Equal Predictive Ability on Average Over a Regularly
###   Gridded Space
### Aliases: lossdiff lossdiff.default lossdiff.SpatialVx
###   empiricalVG.lossdiff flossdiff summary.lossdiff plot.lossdiff
###   print.lossdiff
### Keywords: htest

### ** Examples

grid<- list( x = seq( 0, 5,, 25), y = seq(0,5,,25) )
obj<-Exp.image.cov( grid = grid, theta = .5, setup = TRUE)

look<- sim.rf( obj )
look[ look < 0 ] <- 0
look <- zapsmall( look )
     
look2 <- sim.rf( obj ) * .25
look2[ look2 < 0 ] <- 0
look2 <- zapsmall( look2 )

look3 <- sim.rf( obj) * 2 + 5
look3[ look3 < 0 ] <- 0 
look3 <- zapsmall( look3 )

res <- lossdiff( x = look, xhat1 = look2, xhat2 = look3, lossfun = "abserrloss" )
res <- empiricalVG.lossdiff( res, maxrad = 8 )
res <- flossdiff( res )
res <- summary( res )

plot( res )

## Not run: 
##D data( "pert000" )
##D data( "pert004" )
##D data( "pert006" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( pert000, list( pert004, pert006 ), loc = ICPg240Locs,
##D     projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = c( "pert004", "pert006" ) )
##D 
##D look <- lossdiff( hold, lossfun = "abserrloss" )
##D look <- empiricalVG.lossdiff( look, maxrad = 8 )
##D look <- flossdiff( look )
##D 
##D plot( look )
##D summary( look )
## End(Not run)



