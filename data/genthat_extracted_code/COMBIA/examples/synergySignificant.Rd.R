library(COMBIA)


### Name: synergySignificant
### Title: Function calculates significant synergy/antagonism
### Aliases: synergySignificant

### ** Examples

dataFile <- system.file("extdata", "rawDataPreProcessed.csv", package="COMBIA")
dataSample <- read.csv(dataFile, header=FALSE)
nR <- 8
nC <- 10
rslt <- applyBliss(nR, nC,  as.matrix(dataSample ), 100) 
synergySignificant(rslt, nR, nC,"A", "B", "Cell")



