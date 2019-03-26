library(sptemExp)


### Name: getTidBKMean
### Title: Batch Block Kriging for Estimate of Regional Means
### Aliases: getTidBKMean

### ** Examples


## No test: 
# PM2.5 example.

data("spointspre","countylayer")
regionName="NAME_3"
tarF="d91" # field target name to be estimated (2014-04-01 for 91 day of 2014)
bkRes=getTidBKMean(spointspre,countylayer,regionName,tarF="d91",n=2)
## End(No test)




