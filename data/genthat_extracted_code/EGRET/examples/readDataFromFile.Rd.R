library(EGRET)


### Name: readDataFromFile
### Title: Basic Data Import for Water Flow Data
### Aliases: readDataFromFile
### Keywords: data file import

### ** Examples

filePath <- system.file("extdata", package="EGRET")
fileName <- 'ChoptankRiverFlow.txt'
ChopData <- readDataFromFile(filePath,fileName, separator="\t")



