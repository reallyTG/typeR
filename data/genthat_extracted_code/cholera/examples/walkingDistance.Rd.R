library(cholera)


### Name: walkingDistance
### Title: Compute the shortest walking distance between cases and/or
###   pumps.
### Aliases: walkingDistance

### ** Examples

## Not run: 
##D 
##D # distance from case 1 to nearest pump.
##D walkingDistance(1)
##D 
##D # distance from case 1 to pump 6.
##D walkingDistance(1, 6)
##D 
##D # exclude pump 7 from consideration.
##D walkingDistance(1, -7)
##D 
##D # distance from case 1 to case 6.
##D walkingDistance(1, 6, type = "cases")
##D 
##D # distance from pump 1 to pump 6.
##D walkingDistance(1, 6, type = "pumps")
## End(Not run)



