library(sptemExp)


### Name: genRaster
### Title: Generation of Raster Covering the Side Map
### Aliases: genRaster
### Keywords: ~kwd1 ~kwd2

### ** Examples


## Use the Shandong province as an example:
data("prnside")
ret=genRaster(prnside,dx=2000,dy=2000,idStr="gid")
raster::plot(ret$Rst)
raster::plot(ret$PntObj)




