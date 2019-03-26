library(sensors4plumes)


### Name: interpolationError
### Title: Interpolate many maps at once, compare them to the original and
###   determine a global error
### Aliases: interpolationError

### ** Examples

  data(radioactivePlumes)
  ## preparation
  idw0z = replaceDefault(idw0, newDefaults = list(
    formula = z ~ 1))[[1]]
  sampleLocations100 = sample.int(nLocations(radioactivePlumes), 100)
  fun_Rpl_mean = function(x, nout = 1){ 
    mean(x[,1], na.rm = TRUE)
  }
  ## compute interpolation error 
  ## Not run: 
##D   ## takes some seconds
##D     interpolationError_delineation <- interpolationError(
##D       simulations = radioactivePlumes,
##D       locations = sampleLocations100,
##D       kinds = 2,
##D       fun_interpolation = idw0z,
##D       fun_error = delineationError,
##D       fun_Rpl = fun_Rpl_mean,
##D       fun_Rpl_cellStats = "mean",
##D       fun_l = delineationErrorMap
##D     )    
##D   # cost  
##D   interpolationError_delineation[["cost_cellStats"]]  
##D   ## plot error map
##D   interpolationErrorMaps = radioactivePlumes
##D   interpolationErrorMaps@values = 
##D     stack(radioactivePlumes@values[[2]],
##D           interpolationError_delineation[["interpolated"]],
##D           interpolationError_delineation[["error_locationsplumes"]][[1]])
##D   interpolationErrorMapsSDF = extractSpatialDataFrame(interpolationErrorMaps, plumes = 1:5) 
##D   interpolationErrorMapsSDF@data$costMap = interpolationError_delineation[["costLocations"]]
##D   # original, interpolated, error (1: overestimation, 5: underestimation)
##D   spplotLog(interpolationErrorMapsSDF, zcol = 1:15)
##D   # error summary - mean error of all plumes
##D   spplot(interpolationErrorMapsSDF, zcol = "costMap")
##D 
##D   
## End(Not run)



