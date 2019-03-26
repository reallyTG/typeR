library(cholera)


### Name: walkingPath
### Title: Compute the shortest walking path between cases and/or pumps.
### Aliases: walkingPath

### ** Examples

## Not run: 
##D 
##D # path from case 1 to nearest pump.
##D walkingPath(1)
##D 
##D # path from case 1 to pump 6.
##D walkingPath(1, 6)
##D 
##D # exclude pump 7 from consideration.
##D walkingPath(1, -7)
##D 
##D # path from case 1 to case 6.
##D walkingPath(1, 6, type = "cases")
##D 
##D # path from pump 1 to pump 6.
##D walkingPath(1, 6, type = "pumps")
##D 
##D # path from case 1 to nearest pump.
##D plot(walkingPath(1))
## End(Not run)



