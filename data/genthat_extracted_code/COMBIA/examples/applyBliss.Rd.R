library(COMBIA)


### Name: applyBliss
### Title: Function calculates Bliss Synergy, associated BIs and global BIs
### Aliases: applyBliss

### ** Examples

dataFile <- system.file( "extdata", "rawDataPreProcessed.csv", package="COMBIA" )
dataSample <- read.csv(dataFile, header=FALSE )
nR <- 8
nC <- 10
rslt <- applyBliss(nR, nC,  as.matrix(dataSample ), 500) 



