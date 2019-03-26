library(waterData)


### Name: plotParam
### Title: Plot Streamflow and Continous Water-Quality Data
### Aliases: plotParam
### Keywords: hplot ts univar

### ** Examples

data(exampleWaterData)
plotParam(misQ05054000, code="00060", stat="00003", logscale=TRUE)
plotParam(misQ05054000, code=attributes(misQ05054000)$code, 
stat=attributes(misQ05054000)$stat, logscale=TRUE)



