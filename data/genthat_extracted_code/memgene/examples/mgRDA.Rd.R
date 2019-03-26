library(memgene)


### Name: mgRDA
### Title: Extraction of MEMGENE variables using redundancy analysis (RDA)
### Aliases: mgRDA

### ** Examples

## Not run: 
##D ## Prepare the radial data for analysis
##D radialData <- read.csv(system.file("extdata/radial.csv", package="memgene"))
##D radialGen <- radialData[, -c(1,2)]
##D radialXY <- radialData[, 1:2]
##D 
##D if (require(adegenet)) {
##D   radialDM <- codomToPropShared(radialGen)
##D } else {
##D   stop("adegenent package required to produce genetic distance matrix in example.")
##D }
##D 
##D 
##D ## Find MEM eigenvectors given sampling locations
##D ## by first finding the Euclidean distance matrix
##D radialEuclid <- dist(radialXY)
##D radialMEM <- mgMEM(radialEuclid)
##D 
##D ## Forward select significant MEM eigenvectors using RDA
##D ## Positive MEM eigenvectors (positive spatial autocorrelation) first
##D radialPositive <- mgForward(radialDM,
##D     radialMEM$vectorsMEM[ , radialMEM$valuesMEM > 0])
##D ## Negative MEM eigenvectors (negative spatial autocorrelation) second
##D radialNegative <- mgForward(radialDM,
##D     radialMEM$vectorsMEM[ , radialMEM$valuesMEM < 0])
##D 
##D 
##D ## Summarize the selected MEM eigenvectors
##D allSelected <- cbind(radialMEM$vectorsMEM[, radialMEM$valuesMEM > 0][
##D                     , na.omit(radialPositive$selectedMEM)],
##D                  radialMEM$vectorsMEM[, radialMEM$valuesMEM < 0][
##D                     , na.omit(radialNegative$selectedMEM)])
##D 
##D ## Use the selected MEM eigenvectors in a final model
##D radialAnalysis <- mgRDA(radialDM, allSelected, full=TRUE)
## End(Not run)



