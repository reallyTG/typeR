library(GISTools)


### Name: generalize.polys
### Title: generalize.polys
### Aliases: generalize.polys

### ** Examples

# Data for Georgia to use in example
data(georgia)
# Create an outline of Georgia
georgia.outline <- unionSpatialPolygons(georgia,rep(1,159))
plot(georgia.outline)
georgia.generalised <- generalize.polys(georgia.outline,0.1)
plot(georgia.generalised,add=TRUE,border='red')



