library(rLakeAnalyzer)


### Name: wtr.lineseries
### Title: Creates a line based plot of temperature profile time series
### Aliases: wtr.lineseries
### Keywords: hplot

### ** Examples


exampleFilePath <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")
wtr= load.ts(exampleFilePath)
## Not run: 
##D wtr.lineseries(wtr, ylab = "Temperature C")
## End(Not run)



