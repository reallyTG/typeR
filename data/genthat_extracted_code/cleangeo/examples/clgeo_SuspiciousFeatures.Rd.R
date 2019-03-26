library(cleangeo)


### Name: clgeo_SuspiciousFeatures
### Title: clgeo_SuspiciousFeatures
### Aliases: clgeo_SuspiciousFeatures
### Keywords: geometry validity

### ** Examples

require(maptools)
 file <- system.file("extdata", "example.shp", package = "cleangeo")
 sp <- readShapePoly(file)

 report <- clgeo_CollectionReport(sp)
 nv <- clgeo_SuspiciousFeatures(report)



