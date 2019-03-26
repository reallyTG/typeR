library(SpatialVx)


### Name: waveIS
### Title: Intensity Scale (IS) Verification
### Aliases: waveIS waveIS.default waveIS.SpatialVx plot.waveIS
###   summary.waveIS
### Keywords: math

### ** Examples

data( "UKobs6" )
data( "UKfcst6" )
data( "UKloc" )

hold <- make.SpatialVx( UKobs6, UKfcst6,
    thresholds = c(0.1, 0.2, 0.5, 1, 2, 5, 10, 20, 50),
    loc = UKloc, map = TRUE, field.type = "Rainfall", units = "mm/h",
    data.name = "Nimrod", obs.name = "UKobs6", model.name = "UKfcst6" )

look <- waveIS(hold, J=8, levels=2^(8-1:8), verbose=TRUE)
plot(look, which.plots="mse") 
plot(look, which.plots="ss")
plot(look, which.plots="energy")
summary(look)

## Not run: 
##D data( "pert004" )
##D data( "pert000" )
##D 
##D hold <- make.SpatialVx( pert000, pert004, thresholds = c(1, 10, 50),
##D     loc = ICPg240Locs, projection = TRUE, map = TRUE, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "Perturbed ICP", obs.name = "pert000", model.name = "pert004" )
##D 
##D look <- waveIS(hold, levels=1:4, verbose=TRUE)
##D plot(look, which.plots="mse")
##D plot(look, which.plots="ss")
##D plot(look, which.plots="energy")
##D summary(look)
##D 
## End(Not run)




