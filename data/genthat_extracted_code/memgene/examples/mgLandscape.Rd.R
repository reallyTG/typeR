library(memgene)


### Name: mgLandscape
### Title: Landscape genetic analysis using MEMGENE
### Aliases: mgLandscape print.mgLandscape

### ** Examples


## Not run: 
##D ## Compare data generated using the radial data against three landscape models
##D ##
##D ## Prepare two resistance surfaces to test (the true radial, and the false river)
##D ## These are produced as a RasterStack object
##D if (require(raster)) {
##D     resistanceMaps <- stack(
##D            raster(system.file("extdata/radial.asc", package="memgene")),
##D            raster(system.file("extdata/river.asc", package="memgene")))
##D } else {
##D   stop("raster package required for mgLandscape.")
##D }
##D 
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
##D ## Analyse the two resistance surfaces and a Euclidean model
##D ## and produce a table comparing the three
##D ## Set permutations at low values for a faster (though less accurate) run
##D compareThree <- mgLandscape(resistanceMaps, radialDM, radialXY, euclid=TRUE,
##D    forwardPerm=100, finalPerm=100)
##D    
##D print(compareThree)
##D ## Results can vary between runs because selected MEM eigenvectors may vary.
##D ## Setting forwardPerm higher will increase consistency in this regard.
##D ##
##D ## We see that the true radial surface has the highest [a] fraction and
##D ## the lowest [c] fraction indicating that it does well at capturing
##D ## the spatial genetic variation that we expect in this simulated genetic data
## End(Not run)



