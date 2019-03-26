library(SpatialVx)


### Name: metrV
### Title: Binary Location Metric Proposed in Zhu et al. (2011)
### Aliases: metrV metrV.default metrV.SpatialVx print.metrV
### Keywords: math

### ** Examples


A <- B <- B2 <- matrix( 0, 10, 12)
A[2,3] <- 3
B[4,7] <- 400
B2[10,12] <- 17
hold <- make.SpatialVx( A, list(B, B2), thresholds = c(0.1, 3.1, 500),
    field.type = "contrived", units = "none",
    data.name = "Example", obs.name = "A",
    model.name = c("B", "B2") )

metrV(hold)

metrV(hold, model = c(1,2) )

## Not run: 
##D data( "pert000" )
##D data( "pert001" )
##D data( "ICPg240Locs" )
##D 
##D testobj <- make.SpatialVx( pert000, pert001, thresholds = 1e-8,
##D     projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Perturbed Cases", obs.name = "pert000",
##D     model.name = "pert001" )
##D 
##D metrV(testobj)
##D 
##D # compare above to results in Fig. 3 (top right panel) of Zhu et al. (2011).
##D 
##D data( "geom000" )
##D data( "geom001" )
##D 
##D testobj <- make.SpatialVx( geom000, geom001, thresholds = 0,
##D     projection = TRUE, map = TRUE, loc = ICPg240Locs, loc.byrow = TRUE,
##D     field.type = "Precipitation", units = "mm/h",
##D     data.name = "ICP Geometric Cases", obs.name = "geom000",
##D     model.name = "geom001" )
##D 
##D metrV(testobj)
##D 
##D # compare above to results in Fig. 2 (top right panel)
##D # of Zhu et al. (2011).  Note that they differ wildly.
##D # Perhaps because an actual elliptical area is taken in
##D # the paper instead of finding the values from the fields
##D # themselves?
## End(Not run)




