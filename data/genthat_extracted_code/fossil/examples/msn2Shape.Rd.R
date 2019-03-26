library(fossil)


### Name: msn2Shape
### Title: Convert a Minimum spanning Network or Tree to Shapefile
### Aliases: msn2Shape
### Keywords: datagen

### ** Examples

## Not run: 
##D #import both fdata.lats and fdata.mat
##D data(fdata.lats)
##D data(fdata.mat)
##D fdata.dist<-dino.dist(fdata.mat)
##D fdata.mst<-dino.mst(fdata.dist)
##D shape.mst<-msn2Shape(fdata.mst, fdata.lats)
##D write.shapefile(shape.mst, file='/path/to/write/mst')
## End(Not run)



