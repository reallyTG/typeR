library(Rvcg)


### Name: vcgBorder
### Title: find all border vertices and faces of a triangular mesh
### Aliases: vcgBorder
### Keywords: ~kwd1 ~kwd2

### ** Examples


data(humface)
borders <- vcgBorder(humface)
## view border vertices
## Not run: 
##D require(rgl)
##D points3d(t(humface$vb[1:3,])[which(borders$bordervb == 1),],col=2)
##D wire3d(humface)
##D require(rgl)
## End(Not run)



