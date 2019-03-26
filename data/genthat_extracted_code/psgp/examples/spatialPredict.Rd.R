library(psgp)


### Name: spatialPredict.psgp
### Title: Spatial prediction using a Projected Sequential Gaussian Process
###   (PSGP)
### Aliases: spatialPredict.psgp spatialPredict
### Keywords: spatial

### ** Examples

data(meuse)
meuse = meuse[1:100,]
coordinates(meuse) = ~x+y
meuse$value = log(meuse$zinc)
data(meuse.grid)
gridded(meuse.grid) = ~x+y
proj4string(meuse) = CRS("+init=epsg:28992")
proj4string(meuse.grid) = CRS("+init=epsg:28992")

# Specify a different observation error model for each observation 
nobs = length(meuse$value)      # Number of observations
meuse$oeid = seq(1:nobs)        # One error model per observation

# Indicate the variance for each of these error models
meuse$oevar <- abs( rnorm( max(meuse$oeid) ) )

# Set up intamap object
obj = createIntamapObject(
  observations = meuse,
  predictionLocations = meuse.grid,
  targetCRS = "+init=epsg:3035",
  class = "psgp"
)

# Estimate parameters and predict at new locations (interpolation)
obj = conformProjections(obj)
obj = estimateParameters(obj)
obj = spatialPredict(obj)

# Plot results
plotIntamap(obj)



