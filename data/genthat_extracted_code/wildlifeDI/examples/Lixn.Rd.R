library(wildlifeDI)


### Name: Lixn
### Title: Minta's Spatial-temporal interaction statistics
### Aliases: Lixn
### Keywords: indices

### ** Examples

## Not run: 
##D data(deer)
##D deer37 <- deer[1]
##D deer38 <- deer[2]
##D library(adehabitatHR)
##D library(sp)
##D #use minimum convex polygon for demonstration...
##D hr37 <- mcp(SpatialPoints(ld(deer37)[,1:2]))
##D hr38 <- mcp(SpatialPoints(ld(deer38)[,1:2]))
##D #tc = 7.5 minutes, dc = 50 meters
##D Lixn(deer37, deer38,  method='spatial', tc=7.5*60, hr1=hr37, hr2=hr38)
## End(Not run)



