library(dggridR)


### Name: dgcellstogrid
### Title: Return boundary coordinates for specified cells
### Aliases: dgcellstogrid

### ** Examples

## Not run: 
##D library(dggridR)
##D data(dgquakes)
##D 
##D #Construct a grid with cells about ~1000 miles wide
##D dggs          <- dgconstruct(spacing=1000,metric=FALSE) 
##D dgquakes$cell <- dgtransform(dggs,dgquakes$lat,dgquakes$lon)
##D 
##D #Get grid cells for the earthquakes identified
##D grid          <- dgcellstogrid(dggs, dgquakes$cell, frame=TRUE)
## End(Not run)



