library(cleangeo)


### Name: clgeo_CollectionReport
### Title: clgeo_CollectionReport
### Aliases: clgeo_CollectionReport
### Keywords: geometry validity

### ** Examples

require(maptools)
 file <- system.file("extdata", "example.shp", package = "cleangeo")
 sp <- readShapePoly(file)

 report <- clgeo_CollectionReport(sp)



