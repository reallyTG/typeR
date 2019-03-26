library(crimelinkage)


### Name: makeGroups
### Title: Generates crime groups from crime series data
### Aliases: makeGroups

### ** Examples

data(crimes)
 data(offenders)
 seriesData = makeSeriesData(crimedata=crimes,offenderTable=offenders)
 groups = makeGroups(seriesData,method=1)
 head(groups,10)



