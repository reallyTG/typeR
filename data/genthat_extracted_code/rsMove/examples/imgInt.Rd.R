library(rsMove)


### Name: imgInt
### Title: imgInt
### Aliases: imgInt

### ** Examples

{

 require(raster)

 #'  # read raster data
 file <- list.files(system.file('extdata', '', package="rsMove"), 'ndvi.tif', full.names=TRUE)
 r.stk <- stack(file)
 r.stk <- stack(r.stk, r.stk, r.stk) # dummy files for the example

 # read movement data
 data(shortMove)

 # raster dates
 file.name <- names(r.stk)
 x.dates <- as.Date(paste0(substr(file.name, 2, 5), '-',
 substr(file.name, 7, 8), '-', substr(file.name, 10, 11)))

 # interpolate raster data to target dates
 out <- imgInt(r.stk[1:50,1:50,drop=FALSE], x.dates, as.Date("2013-08-10"), c(60,60))

}



