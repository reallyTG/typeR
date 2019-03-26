library(hydroTSM)


### Name: smry
### Title: Summary
### Aliases: smry smry.default smry.zoo smry.Date smry.matrix
###   smry.data.frame
### Keywords: manip

### ** Examples

## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Summary of monthly precipitation values for the first 7 stations in 'EbroPPtsMonthly'
smry(EbroPPtsMonthly[,2:8])



