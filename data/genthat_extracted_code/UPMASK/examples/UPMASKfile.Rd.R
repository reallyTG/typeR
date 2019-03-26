library(UPMASK)


### Name: UPMASKfile
### Title: Run UPMASK in a file
### Aliases: UPMASKfile
### Keywords: misc, utilities

### ** Examples

## Not run: 
##D # Analyse a simulated open cluster using spatial and photometric data
##D # Create strings with filenames
##D fileNameI <- "oc_12_500_1000_1.0_p019_0880_1_25km_120nR_withcolors.dat"
##D inputFileName <- system.file("extdata", fileNameI, package="UPMASK")
##D outputFileName <- file.path(tempdir(), "up-RESULTS.dat")
##D 
##D # Example of how to run UPMASK using data from a file
##D # (serious analysis require at least larger nRuns)
##D posIdx <- c(1,2)
##D photIdx <- c(3,5,7,9,11,19,21,23,25,27)
##D photErrIdx <- c(4,6,8,10,12,20,22,24,26,28)
##D UPMASKfile(inputFileName, outputFileName, posIdx, photIdx, photErrIdx, nRuns=5,
##D            starsPerClust_kmeans=25, verbose=TRUE, fileWithHeader=TRUE)
##D 
##D # Open the resulting file to inspect the results
##D tempResults <- read.table(outputFileName, header=TRUE)
##D 
##D # Create a simple raw plot to see the results
##D pCols <- tempResults[,length(tempResults)]/max(tempResults[,length(tempResults)])
##D plot(tempResults[,1], tempResults[,2], col=rgb(0,0,0,pCols), cex=0.5, pch=19)
##D 
##D # Clean the environment
##D rm(list=c("tempResults", "inputFileName", "outputFileName", "pCols", "fileNameI"))
## End(Not run)



