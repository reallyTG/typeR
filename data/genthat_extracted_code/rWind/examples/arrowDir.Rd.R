library(rWind)


### Name: arrowDir
### Title: Arrow direction fitting for Arrowhead function from "shape"
###   package
### Aliases: arrowDir
### Keywords: ~wind

### ** Examples

data(wind.data)

# Create a vector with wind direction (angles) adapted
alpha <- arrowDir(wind.data)

## Not run: 
##D # Now, you can plot wind direction with Arrowhead function from shapes package
##D # Load "shape package
##D require(shape)
##D plot(wind.data$lon, wind.data$lat, type="n")
##D Arrowhead(wind.data$lon, wind.data$lat, angle=alpha,
##D           arr.length = 0.1, arr.type="curved")
## End(Not run)




