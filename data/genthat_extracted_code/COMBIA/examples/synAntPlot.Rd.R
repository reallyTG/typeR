library(COMBIA)


### Name: synAntPlot
### Title: This function plots the synergy analysis 2D and 3D graphs
### Aliases: synAntPlot

### ** Examples

dataFile <- system.file("extdata", "processedData.csv", package="COMBIA")
procData <- read.csv( dataFile, header=FALSE)
xConc <- c(0.00,  0.20, 0.39, 0.78,  1.56,  3.12,  6.25, 12.50, 25.00, 50) 
yConc <- c(128,  64,  32,  16,   8,   4,   2,   0)
xD <- "X_Drug"
yD <- "Y_Drug"
clN <- "myCell"
rslt <- synAntPlot(as.matrix(procData),xConc,yConc, xD, yD, clN)  



