library(UPMASK)


### Name: UPMASKdata
### Title: Run UPMASK in a data frame
### Aliases: UPMASKdata
### Keywords: cluster, methods, multivariate, nonparametric

### ** Examples

## Not run: 
##D # Analyse a simulated open cluster using spatial and photometric data
##D # Load the data into a data frame
##D fileNameI <- "oc_12_500_1000_1.0_p019_0880_1_25km_120nR_withcolors.dat"
##D inputFileName <- system.file("extdata", fileNameI, package="UPMASK")
##D ocData <- read.table(inputFileName, header=TRUE)
##D 
##D # Example of how to run UPMASK using data from a data frame
##D # (serious analysis require at least larger nRuns)
##D posIdx <- c(1,2)
##D photIdx <- c(3,5,7,9,11,19,21,23,25,27)
##D photErrIdx <- c(4,6,8,10,12,20,22,24,26,28)
##D 
##D upmaskRes <- UPMASKdata(ocData, posIdx, photIdx, PhotErrIdx, nRuns=2,
##D                         starsPerClust_kmeans=25, verbose=TRUE)
##D 
##D # Create a simple raw plot to see the results
##D pCols <- upmaskRes[,length(upmaskRes)]/max(upmaskRes[,length(upmaskRes)])
##D plot(upmaskRes[,1], upmaskRes[,2], col=rgb(0,0,0,pCols), cex=0.5, pch=19)
##D 
##D # Clean the environment
##D rm(list=c("inputFileName", "ocData", "posIdx", "photIdx", "photErrIdx",
##D           "upmaskRes", "pCols"))
## End(Not run)



