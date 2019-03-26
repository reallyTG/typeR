library(memgene)


### Name: mgQuick
### Title: Memgene analysis of genetic distance data (main interface for
###   package)
### Aliases: mgQuick

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
##D ## Extract the scores on the first 3 MEMGENE variables
##D ## for subsequent analysis
##D radialMEMGENE1 <- radialAnalysis$memgene[, 1]
##D radialMEMGENE2 <- radialAnalysis$memgene[, 2]
##D radialMEMGENE3 <- radialAnalysis$memgene[, 3]
##D 
##D ## Find the proportion of variation explained by all MEMGENE variables
##D propVariation <- radialAnalysis$sdev/sum(radialAnalysis$sdev)
## End(Not run)



