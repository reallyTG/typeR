library(hydroTSM)


### Name: rm1stchar
### Title: Remove First Character(s)
### Aliases: rm1stchar
### Keywords: manip

### ** Examples

## Loading the monthly time series of precipitation within the Ebro River basin.
data(EbroPPtsMonthly)

# Getting the name of each gauging station.
names <- colnames(EbroPPtsMonthly)

# Removing the initial letter 'P' of the name of each gauging station.
rm1stchar(names)




