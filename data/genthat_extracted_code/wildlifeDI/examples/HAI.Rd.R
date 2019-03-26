library(wildlifeDI)


### Name: HAI
### Title: Half-weight Association Index
### Aliases: HAI
### Keywords: indices

### ** Examples

## Not run: 
##D data(deer)
##D deer37 <- deer[1]
##D deer38 <- deer[2]
##D library(adehabitatHR)
##D library(sp)
##D library(rgeos)
##D #use minimum convex polygon for demonstration...
##D hr37 <- mcp(SpatialPoints(ld(deer37)[,1:2]))
##D hr38 <- mcp(SpatialPoints(ld(deer38)[,1:2]))
##D OZ <- gIntersection(hr37,hr38)
##D #tc = 7.5 minutes, dc = 50 meters
##D HAI(deer37, deer38, OZ=OZ, tc=7.5*60, dc=50)
## End(Not run)



