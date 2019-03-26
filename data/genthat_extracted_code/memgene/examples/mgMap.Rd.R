library(memgene)


### Name: mgMap
### Title: Visualization of MEMGENE variables
### Aliases: mgMap

### ** Examples

## Not run: 
##D ## Prepare the radial data for analysis
##D radialData <- read.csv(system.file("extdata/radial.csv", package="memgene"))
##D radialGen <- radialData[, -c(1,2)]
##D radialXY <- radialData[, 1:2]
##D if (require(adegenet)) {
##D   radialDM <- codomToPropShared(radialGen)
##D } else {
##D   stop("adegenent package required to produce genetic distance matrix in example.")
##D }
##D 
##D ## Run the MEMGENE analysis
##D radialAnalysis <- mgQuick(radialDM, radialXY)
##D 
##D ## Visualize the first two MEMGENE variables side-by-side
##D mgMap(radialXY, radialAnalysis$memgene[, 1:2])
##D 
##D ## Visualize the first MEMGENE variable superimposed over a raster map
##D ## with the same coordinate system, AND include a legend
##D if (require(raster)) {
##D     resistanceMap <- raster(system.file("extdata/radial.asc", package="memgene"))
##D     plot(resistanceMap, legend=FALSE)
##D     mgMap(radialXY, radialAnalysis$memgene[, 1], add.plot=TRUE, legend=TRUE)
##D } else {
##D     mgMap(radialXY, radialAnalysis$memgene[, 1], legend=TRUE)
##D }
##D 
## End(Not run)



