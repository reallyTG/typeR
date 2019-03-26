library(EGRET)


### Name: readUserSample
### Title: Import user-supplied sample data for EGRET analysis
### Aliases: readUserSample
### Keywords: data file import

### ** Examples

filePath <- system.file("extdata", package="EGRET")
fileName <- 'ChoptankRiverNitrate.csv'
Sample <- readUserSample(filePath,fileName, separator=";",interactive=FALSE)



