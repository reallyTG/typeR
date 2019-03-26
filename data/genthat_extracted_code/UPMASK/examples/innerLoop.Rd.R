library(UPMASK)


### Name: innerLoop
### Title: UPMASK inner loop
### Aliases: innerLoop
### Keywords: cluster, methods, multivariate, nonparametric

### ** Examples

## Not run: 
##D # Perform a one run of the innerLoop using a simulated open cluster with
##D # spatial and photometric data
##D # Load the data into a data frame
##D fileName <- "oc_12_500_1000_1.0_p019_0880_1_25km_120nR_withcolors.dat"
##D inputFileName <- system.file("extdata", fileName, package="UPMASK")
##D ocData <- read.table(inputFileName, header=TRUE)
##D ocData <- data.frame(ocData, id=(1:length(ocData[,1]))) # create an id
##D 
##D # Prepare the data to run the inner loop
##D posIdx <- c(1,2)
##D photIdx <- c(3,5,7,9,11,19,21,23,25,27)
##D 
##D # Create the look up table
##D library(RSQLite)
##D stcon <- create_smartTable()
##D 
##D # Run the inner loop
##D innerLoopRes <- innerLoop(ocData, ocData[,photIdx], autoThresholdLevel=1, verbosity=2,
##D                           starsPerClust_kmeans=25, positionDataIndexes=posIdx,
##D                           smartTableDB=stcon)
##D 
##D # Clean the environment
##D rm(list=c("inputFileName", "ocData", "posIdx", "photIdx", "innerLoopRes",
##D    "fileName"))
##D dbDisconnect(stcon)
## End(Not run)



