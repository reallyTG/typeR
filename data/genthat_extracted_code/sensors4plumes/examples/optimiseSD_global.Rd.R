library(sensors4plumes)


### Name: optimiseSD_global
### Title: Derive one or all globally optimal sampling designs for plume
###   detection
### Aliases: optimiseSD_global

### ** Examples

# prepare data
# test case from reference
detectionMatrix = matrix(c(0,1,0,0,0,1,
                          1,0,1,0,0,0,
                          0,1,1,1,0,0,
                          1,0,0,0,0,0,
                          0,0,0,1,1,0,
                          1,1,0,0,0,0,
                          0,0,1,0,0,1),
                        nrow = 7, ncol = 6, byrow = TRUE)
data(SimulationsSmall)
completeExample = Simulations(
  locations = SimulationsSmall@locations[1:7,],
  plumes = SimulationsSmall@plumes[1:6,],
  values = raster(x = detectionMatrix,
             xmn = -90, xmx = 90, ymn = -90, ymx = 90,
             crs = "+init=epsg:4326"))

# the function is to be used inside of optimiseSD
# change algorithm specific parameters 'detectable', 'findAllOptima'
optSDglobal = replaceDefault(
  fun = optimiseSD_global,
  newDefaults = list(
    detectable = 1,
    findAllOptima = TRUE
    ),
  type = "optimisationFun.optimiseSD"
)

# run optimisation
## Not run: 
##D # takes some (little) time
##D optSD_global = optimiseSD(
##D   simulations = completeExample,
##D   aimNumber = 3,
##D   costFun = NA,
##D   optimisationFun = optSDglobal[[1]],
##D   nameSave = NA
##D )
## End(Not run)
## this result is also in data(SDglobal)

data(SDglobal)
# visualise result
## which plumes are detected?
detAtSensors = matrix(completeExample@values[SDglobal$SD[[1]][1,],],
  byrow = TRUE, nrow = 3)
undetedtedPlumes = ! apply(FUN = any, X = detAtSensors, MARGIN = 2)
## cost is fraction of undetected plumes
sum(undetedtedPlumes)/nPlumes(completeExample) == SDglobal$cost

## map of undetected plumes
detectablePlumesLoc = matrix(getValues(completeExample@values),
  byrow = TRUE, ncol = nPlumes(completeExample))
completeExample@locations@data$detectable = apply(FUN = sum, X = detectablePlumesLoc,
	MARGIN = 1)

SDopt = as(subsetSDF(completeExample@locations,
                   locations =  SDglobal$SD[[1]][1,]),
         "SpatialPointsDataFrame")

spplot(completeExample@locations, zcol = "detectable",
  sp.layout = list(list("sp.points",
  SpatialPoints(coords = coordinates(SDopt), proj4string = CRS(proj4string(SDopt))),
                        col = 3, cex = 2, lwd = 1.5)))



