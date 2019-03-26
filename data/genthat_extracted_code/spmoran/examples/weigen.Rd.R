library(spmoran)


### Name: weigen
### Title: Extraction of eigenvectors from a spatial weight matrix
### Aliases: weigen

### ** Examples

require(spdep);library(rgdal)
data(boston)

########## Rook adjacency-based W
poly	    <- readOGR(system.file("shapes/boston_tracts.shp",package="spData")[1])
weig1	    <- weigen( poly )

########## knn-based W
coords    <- boston.c[,c("LAT", "LON")]
weig2	    <- weigen( coords, type = "knn" )

########## Delaunay triangulation-based W
coords    <- boston.c[,c("LAT", "LON")]
weig3	    <- weigen( coords, type = "tri")

########## User-specified W
dmat      <- as.matrix(dist(coords))
cmat 	    <- exp(-dmat)
diag(cmat)<- 0
weig4	    <- weigen( cmat, threshold = 0 )



