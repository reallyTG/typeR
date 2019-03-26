library(cleangeo)


### Name: clgeo_Clean
### Title: clgeo_Clean
### Aliases: clgeo_Clean
### Keywords: clean geometry summary validity

### ** Examples

## No test: 
 require(maptools)
 file <- system.file("extdata", "example.shp", package = "cleangeo")
 sp <- readShapePoly(file)

 sp.clean <- clgeo_Clean(sp)
 report.clean <- clgeo_CollectionReport(sp.clean)
 clgeo_SummaryReport(report.clean)
## End(No test)



