library(rsMove)


### Name: dataQuery
### Title: dataQuery
### Aliases: dataQuery

### ** Examples

{

 require(raster)

 # read raster data
 file <- list.files(system.file('extdata', '', package="rsMove"), 'ndvi.tif', full.names=TRUE)
 r.stk <- stack(file)
 r.stk <- stack(r.stk, r.stk, r.stk) # dummy files for the example

 # read movement data
 data(shortMove)

 # raster dates
 file.name <- names(r.stk)
 x.dates <- as.Date(paste0(substr(file.name, 2, 5), '-',
 substr(file.name, 7, 8), '-', substr(file.name, 10, 11)))

 # sample dates
 y.dates <- as.Date(shortMove@data$date)

 # retrieve remote sensing data for samples
 rsQuery <- dataQuery(r.stk, shortMove, x.dates, y.dates, c(10,10))

}




