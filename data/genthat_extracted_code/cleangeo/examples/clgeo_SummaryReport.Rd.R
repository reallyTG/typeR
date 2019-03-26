library(cleangeo)


### Name: clgeo_SummaryReport
### Title: clgeo_SummaryReport
### Aliases: clgeo_SummaryReport
### Keywords: geometry summary validity

### ** Examples

require(maptools)
 file <- system.file("extdata", "example.shp", package = "cleangeo")
 sp <- readShapePoly(file)

 report <- clgeo_CollectionReport(sp)
 clgeo_SummaryReport(report)



