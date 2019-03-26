library(sampSurf)


### Name: Tract
### Title: Generate Objects of Class "'Tract'"
### Aliases: Tract
### Keywords: ~kwd1 ~kwd2

### ** Examples

tract = Tract(c(x=20,y=20), cellSize=0.25)    #extents constructor
tr = Tract(,0.5, c(x=20,y=20),c(0.25,0.25),units='metric') #missing constructor
tr2 = Tract(cellSize=0.5, cellDims=c(x=20,y=20), cellCenter=c(0.25,0.25),
            units='metric') #same constructor as the previous
tr.ext = Tract(c(x=10,y=15), cellSize=0.5) #maximal extent constructor
#bounding box constructor...
bb = bbox(tr.ext)
bb[,1] = c(5,4)
tr3 = Tract(bb, 0.5)
#RasterLayer constructor...
ex = extent(tr3)
rl = raster(ex, nrow=10, ncols=10, crs=NA)
## Not run: 
##D tr4 = Tract(rl)  #error: non-square grid cells
## End(Not run)
rl = raster(ex, nrow=22, ncol=10, crs=NA)
tr4 = Tract(rl)  #okay, square cells



