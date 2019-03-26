library(rLakeAnalyzer)


### Name: wtr.plot.temp
### Title: Creates a time series plot of the thermocline and top and bottom
###   of the metalimnion
### Aliases: wtr.plot.temp
### Keywords: hplot

### ** Examples



wtr.path <- system.file('extdata', 'Sparkling.wtr', package="rLakeAnalyzer")

#Load data for example lake, Sparkilng Lake, Wisconsin.
wtr = load.ts(wtr.path)

## Not run: 
##D wtr.plot.temp(wtr)
## End(Not run)




