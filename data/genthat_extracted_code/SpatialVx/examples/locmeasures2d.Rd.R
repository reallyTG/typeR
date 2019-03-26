library(SpatialVx)


### Name: locmeasures2d
### Title: Binary Image Measures
### Aliases: locmeasures2d locmeasures2d.default locmeasures2d.SpatialVx
###   summary.locmeasures2d print.locmeasures2d
### Keywords: math

### ** Examples

x <- y <- matrix(0, 10, 12)
x[2,3] <- 1
y[4,7] <- 1

hold <- make.SpatialVx(x, y, thresholds = 0.1,
    field.type = "random", units = "grid squares")
locmeasures2d(hold, k = 1)

# Alternatively ...
locmeasures2d(x, thresholds = 0.1, k = 1, Y = y)

## Not run: 
##D data( "geom000" )
##D data( "geom001" )
##D data( "ICPg240Locs" )
##D 
##D hold <- make.SpatialVx( geom000, geom001, thresholds = c(0.1, 50.1), 
##D     projection = TRUE, map=TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "in/100",
##D     data.name= "ICP Geometric Cases", obs.name = "geom000",
##D     model.name = "geom001" )
##D 
##D hold2 <- locmeasures2d(hold, k=c(4, 0.975), alpha=c(0.1,0.9))
##D summary(hold2)
## End(Not run)



