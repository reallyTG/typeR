library(crimelinkage)


### Name: makeSeriesData
### Title: Make crime series data
### Aliases: makeSeriesData

### ** Examples

data(crimes)
 data(offenders)

 seriesData = makeSeriesData(crimedata=crimes,offenderTable=offenders)
 head(seriesData)

 nCrimes = table(seriesData$offenderID)  # length of each crime series
 table(nCrimes)                  # distribution of crime series length
 mean(nCrimes>1)                 # proportion of offenders with multiple crimes

 nCO = table(seriesData$crimeID) # number of co-offenders per crime
 table(nCO)                      # distribution of number of co-offenders
 mean(nCO>1)                     # proportion of crimes with multiple co-offenders



