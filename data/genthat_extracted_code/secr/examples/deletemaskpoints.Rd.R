library(secr)


### Name: deleteMaskPoints
### Title: Edit Mask Points
### Aliases: deleteMaskPoints
### Keywords: manip

### ** Examples


## Not run: 
##D mask0 <- make.mask (traps(captdata))
##D ## Method 1 - click on each point to remove
##D mask1 <- deleteMaskPoints (mask0)
##D ## Method 2 - click on vertices of removal polygon
##D mask2 <- deleteMaskPoints (mask0, onebyone = FALSE)
##D ## Method 3 - predefined removal polygon
##D plot(captdata)
##D poly1 <- locator(5)
##D mask3 <- deleteMaskPoints (mask0, poly = poly1)
## End(Not run)




