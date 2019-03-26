library(hydroTSM)


### Name: hydropairs
### Title: Visual Correlation Matrix
### Aliases: hydropairs
### Keywords: math graphs

### ** Examples

## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

## Visualizing the correlation among the monthly precipitation values 
## of the first 3 gauging stations in 'EbroPPtsMonthly'. 
## The first column of 'EbroPPtsMonthly' has the dates.
hydropairs(EbroPPtsMonthly[,2:4])



