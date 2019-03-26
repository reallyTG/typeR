library(intamap)


### Name: conformProjections
### Title: Getting conformed projections
### Aliases: conformProjections
### Keywords: spatial

### ** Examples

data(meuse)
coordinates(meuse) = ~x+y
proj4string(meuse) <- CRS("+proj=stere +lat_0=52.15616055555555 
    +lon_0=5.38763888888889 +k=0.999908 +x_0=155000 +y_0=463000 +ellps=bessel +units=m")

predictionLocations = spsample(meuse, 50, "regular")

krigingObject = createIntamapObject(
	observations = meuse,
	predictionLocations = predictionLocations,
  formulaString = as.formula("log(zinc)~1"),
  intCRS = "+init=epsg:3035"
	)

krigingObject = conformProjections(krigingObject)
proj4string(meuse)
proj4string(krigingObject$observations)



