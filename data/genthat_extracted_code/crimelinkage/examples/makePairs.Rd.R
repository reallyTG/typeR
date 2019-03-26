library(crimelinkage)


### Name: makePairs
### Title: Generates indices of linked and unlinked crime pairs (with
###   weights)
### Aliases: makeLinked makePairs makeUnlinked

### ** Examples

data(crimes)
 data(offenders)
 seriesData = makeSeriesData(crimedata=crimes,offenderTable=offenders)
 allPairs = makePairs(seriesData,thres=365,m=40)



