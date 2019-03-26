library(SpatialVx)


### Name: FQI
### Title: Forecast Quality Index
### Aliases: FQI UIQI ampstats print.fqi summary.fqi
### Keywords: math

### ** Examples

data( "ExampleSpatialVxSet" )

x <- ExampleSpatialVxSet$vx
xhat <- ExampleSpatialVxSet$fcst

# Now, find surrogates of the simulated field.
z <- surrogater2d(x, zero.down=TRUE, n=10)

u <- list( X = cbind( quantile( c(x), c(0.75, 0.9)) ),
            Xhat = cbind( quantile( c(xhat), c(0.75, 0.9) ) ) )

hold <- make.SpatialVx(x, xhat, thresholds = u,
    field.type = "Example", units = "none",
    data.name = "ExampleSpatialVxSet", 
    obs.name = "X", model.name = "Xhat" )

FQI(hold, surr = z, k = c(4, 0.75) )



