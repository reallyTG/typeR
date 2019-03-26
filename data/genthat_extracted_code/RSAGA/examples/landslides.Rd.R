library(RSAGA)


### Name: landslides
### Title: Landslide inventory, study area mask and DEM
### Aliases: landslides dem study_area

### ** Examples

## Not run: 
##D library("RSAGA")
##D data(landslides)
##D 
##D # Print the DEM header:
##D dem$header
##D 
##D # Write the DEM to a SAGA grid:
##D write.sgrd(data = dem, file = "dem", header = dem$header, env = env)
##D 
##D # Calculate slope of DEM:
##D rsaga.slope(in.dem = "dem", out.slope = "slope", method = "poly2zevenbergen")
##D 
##D # Pick slope values at landslide points,
##D # added to landslides data.frame as variable "slope":
##D landslides <- pick.from.saga.grid(data = landslides,
##D                                   filename = "slope",
##D                                   varname = "slope")
## End(Not run)



