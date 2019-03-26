library(EGRET)


### Name: readUserDaily
### Title: Import user daily data for EGRET analysis
### Aliases: readUserDaily
### Keywords: USGS WRTDS data file import

### ** Examples

filePath <- system.file("extdata", package="EGRET")
fileName <- "ChoptankRiverFlow.txt"
Daily <- readUserDaily(filePath,fileName,separator="\t")



