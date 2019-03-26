library(sensors4plumes)


### Name: interpolate
### Title: Interpolate many maps at once - even if they do not fit into
###   memory
### Aliases: interpolate fitMedianVariogram idw0z

### ** Examples

## Not run: 
##D ## takes some time
##D # get data
##D data(radioactivePlumes)
##D 
##D # generate median variogram from plumes
##D \dontrun{
##D ## takes some seconds
##D medianVariogram = fitMedianVariogram(simulations = radioactivePlumes, 
##D                               plumes = 1:nPlumes(radioactivePlumes),
##D                               kinds = 1)
##D }
##D ## the result is in:
##D data(medianVariogram)
##D 
##D # prepare interpolation function 
##D krige0var = replaceDefault(krige0, newDefaults = list(
##D   formula = z ~ 1, model = medianVariogram, beta = NA, ... = NA),
##D   type = "fun_interpolation.interpolate")[[1]]
##D 
##D # sample locations: proposed sensors
##D sampleLocations = sample.int(nLocations(radioactivePlumes), 50)
##D 
##D # interpolate
##D interpolated = interpolate(
##D   simulations = radioactivePlumes,
##D   kinds = 1,
##D   locations = sampleLocations,
##D   fun_interpolation = krige0var)
##D   
##D # combine plot original and interpolated
##D originalAndInterpolated = radioactivePlumes
##D originalAndInterpolated@values = stack(
##D   originalAndInterpolated@values[[1]], interpolated)
##D 
##D OriginalAndInterpolated = extractSpatialDataFrame(
##D   originalAndInterpolated, plumes = 1:4)
##D 
##D samplePoints = 
##D   as(OriginalAndInterpolated, "SpatialPointsDataFrame")[sampleLocations,]
##D spplotLog(OriginalAndInterpolated,
##D   sp.layout = list("sp.points", 
##D     samplePoints, col = 3))
##D spplot(OriginalAndInterpolated,
##D   sp.layout = list("sp.points", 
##D     samplePoints, col = 3))
##D 
## End(Not run)



