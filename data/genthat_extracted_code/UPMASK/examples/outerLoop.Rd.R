library(UPMASK)


### Name: outerLoop
### Title: UPMASK outer loop
### Aliases: outerLoop
### Keywords: cluster, methods, multivariate, nonparametric

### ** Examples

## Not run: 
##D # Perform a one run of the outerLoop using a simulated open cluster with
##D # spatial and photometric data
##D # Load the data into a data frame
##D fileName <- "oc_12_500_1000_1.0_p019_0880_1_25km_120nR_withcolors.dat"
##D inputFileName <- system.file("extdata", fileName, package="UPMASK")
##D ocData <- read.table(inputFileName, header=TRUE)
##D 
##D # Create the look up table
##D library(RSQLite)
##D stcon <- create_smartTable()
##D 
##D # Run the outer loop
##D posIdx <- c(1,2)
##D photIdx <- c(3,5,7,9,11,19,21,23,25,27)
##D photErrIdx <- c(4,6,8,10,12,20,22,24,26,28)
##D outerLoopRes <- outerLoop(ocData, posIdx, photIdx, PhotErrIdx,
##D                           starsPerClust_kmeans=25, verbose=TRUE, smartTableDB=stcon)
##D 
##D # Clean the environment
##D rm(list=c("inputFileName", "ocData", "posIdx", "photIdx", "photErrIdx",
##D           "outerLoopRes", "fileName"))
##D dbDisconnect(stcon)
## End(Not run)



