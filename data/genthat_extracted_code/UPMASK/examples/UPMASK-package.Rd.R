library(UPMASK)


### Name: UPMASK-package
### Title: Unsupervised Photometric Membership Assignment in Stellar
###   Clusters
### Aliases: UPMASK-package UPMASK
### Keywords: package

### ** Examples

## Not run: 
##D #
##D # Example of how to run UPMASK using data from a file
##D # Note: serious analysis require larger nRuns, and see UPMASKfile documentation 
##D # for the parametrization.
##D # Write a string with the filename of the input and output files
##D inputFileName <- system.file("extdata", 
##D              "oc_12_500_1000_1.0_p019_0880_1_25km_120nR_withcolors.dat", package="UPMASK")
##D outputFileName <- file.path(tempdir(), "RESULTS.dat")
##D # Run UPMASK
##D UPMASKfile(inputFileName, outputFileName, nRuns=5, starsPerClust_kmeans=25, 
##D           verbose=TRUE, fileWithHeader=TRUE)          
##D # Done, the results are written to the file outputFileName
##D 
##D #
##D # Example of how to run UPMASK using data from a data frame 
##D # Note: serious analysis require larger nRuns, and see UPMASKdata documentation 
##D # for the parametrization.
##D # Load the data into a data frame
##D inputFileName <- system.file("extdata", 
##D              "oc_12_5000_4000_4.0_p019_0900_1_15km_120nR_withcolors.dat", package="UPMASK")
##D ocData <- read.table(inputFileName, header=TRUE)
##D # Run UPMASK
##D upmaskRes <- UPMASKdata(ocData, nRuns=5, starsPerClust_kmeans=25, verbose=TRUE)
##D # Done, the results are in the data frame upmaskRes
##D 
##D # Clean the environment
##D rm(list=c("inputFileName","outputFileName","ocData","upmaskRes"))
## End(Not run)



