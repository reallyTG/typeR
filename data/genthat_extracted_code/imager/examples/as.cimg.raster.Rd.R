library(imager)


### Name: as.cimg.raster
### Title: Convert a raster object to a cimg object
### Aliases: as.cimg.raster

### ** Examples

rst <- as.raster(matrix((1:4)/4,2,2))
as.cimg(rst) %>% plot(int=FALSE)
all.equal(rst,as.raster(as.cimg(rst)))




