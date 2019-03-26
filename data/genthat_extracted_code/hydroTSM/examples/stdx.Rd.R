library(hydroTSM)


### Name: stdx
### Title: Standarization
### Aliases: stdx stdx.default stdx.matrix stdx.data.frame
### Keywords: manip

### ** Examples

############
## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

# Standarizing only some values of 'EbroPPtsMonthly'
stdx(as.matrix(EbroPPtsMonthly[1:70,10:13]))



