library(COMBIA)


### Name: combineDataFromMultipleFiles
### Title: Combine data from multiple files
### Aliases: combineDataFromMultipleFiles

### ** Examples

xConc <- c(0.00,  0.20,  0.39,  0.78,  1.56,  3.12,  6.25, 12.50, 25.00, 50) 
yConc <- c(128,  64,  32,  16,   8,   4,   2,   0)
rN <- 4
fN <- 1
trN <- 4
dataFile <- system.file("extdata", "rawDataPreProcessed.csv", package="COMBIA")
dataSample <- read.csv(dataFile, header=FALSE )
replList <- list(vector, 4)
for( i in 1:4)
{ replList[[i]] <- dataSample[i,] }
rslt <- combineDataFromMultipleFiles(list(yConc), 
list(xConc), rN,fN,trN, replList )



