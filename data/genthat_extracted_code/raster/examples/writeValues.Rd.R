library(raster)


### Name: writeValues
### Title: Write values to a file
### Aliases: writeStart writeStart,RasterLayer,character-method
###   writeStart,RasterBrick,character-method writeStop
###   writeStop,RasterLayer-method writeStop,RasterBrick-method writeValues
###   writeValues,RasterLayer,vector-method
###   writeValues,RasterBrick,matrix-method
### Keywords: spatial methods

### ** Examples
 

r <- raster(system.file("external/test.grd", package="raster"))
# write to a new binary file in chunks
s <- raster(r)
# 
tr <- blockSize(r)
tr
s <- writeStart(s, filename='test.grd',  overwrite=TRUE)
for (i in 1:tr$n) {
	v <- getValuesBlock(r, row=tr$row[i], nrows=tr$nrows[i])
	s <- writeValues(s, v, tr$row[i])
}
s <- writeStop(s)

if(require(rgdal)){
s2 <- writeStart(s, filename='test2.tif', format='GTiff', overwrite=TRUE)
# writing last row first
for (i in tr$n:1) {
	v <- getValuesBlock(r, row=tr$row[i], nrows=tr$nrows[i])
	s2 <- writeValues(s2, v, tr$row[i])
}
# row number 5 once more
v <- getValuesBlock(r, row=5, nrows=1)
writeValues(s2, v, 5)
s2 <- writeStop(s2)
}

## write values of a RasterStack to a RasterBrick
s <- stack(system.file("external/rlogo.grd", package="raster"))
# create empty brick
b <- brick(s, values=FALSE)  
b <- writeStart(b, filename="test.grd", format="raster",overwrite=TRUE)
tr <- blockSize(b)
for (i in 1:tr$n) {
	v <- getValuesBlock(s, row=tr$row[i], nrows=tr$nrows[i])
	b <- writeValues(b, v, tr$row[i])
}
b <- writeStop(b)
# note that the above is equivalent to 
# b <- writeRaster(s, filename="test.grd", format="raster",overwrite=TRUE)




