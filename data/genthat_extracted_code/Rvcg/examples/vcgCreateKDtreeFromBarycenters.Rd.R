library(Rvcg)


### Name: vcgCreateKDtreeFromBarycenters
### Title: create a KD-tree from Barycenters for multiple closest point
###   searches on a mesh
### Aliases: vcgCreateKDtreeFromBarycenters

### ** Examples

## Not run: 
##D data(humface);data(dummyhead)
##D barytree <- vcgCreateKDtreeFromBarycenters(humface)
##D closest <- vcgClostOnKDtreeFromBarycenters(barytree,dummyhead.mesh,k=50,threads=1)
## End(Not run)



