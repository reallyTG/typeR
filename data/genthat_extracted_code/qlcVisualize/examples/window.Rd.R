library(qlcVisualize)


### Name: window
### Title: Producing windows of class "owin"
### Aliases: hullToOwin gadmToOwin mapsToOwin

### ** Examples

# Boundary of the German state "Hessen"
# This will need to access the GADM database online
## Not run: 
##D boundary <- gadmToOwin("DEU","Hessen",1)
## End(Not run)

# A window does not have to be continuous
## Not run: 
##D random <- mapsToOwin(c("Germany","Greece"))
##D plot(random, main = NULL)
## End(Not run)

# hull around some points
# note influence of alpha and shift
data(hessen)

hull <- hullToOwin(hessen$villages, shift = 0.2, alpha = 1)
plot(hull)
points(hessen$villages)

hull <- hullToOwin(hessen$villages, shift = 0.1, alpha = 0.2)
plot(hull)
points(hessen$villages)




