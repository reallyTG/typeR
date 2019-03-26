library(dggridR)


### Name: dgtransform
### Title: (DEPRECATED) Converts lat-long pairs into discrete global grid
###   cell numbers
### Aliases: dgtransform

### ** Examples

## Not run: 
##D library(dggridR)
##D data(dgquakes)
##D 
##D #Construct a grid with cells about ~1000 miles wide
##D dggs          <- dgconstruct(spacing=1000,metric=FALSE) 
##D dgquakes$cell <- dgtransform(dggs,dgquakes$lat,dgquakes$lon)
## End(Not run)



