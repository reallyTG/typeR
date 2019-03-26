library(COST)


### Name: Wind6month
### Title: Wind speed data from 10 sites
### Aliases: Wind6month
### Keywords: datasets

### ** Examples

data(Wind6month)
Y.ob = Wind6month[,-3]
Y.newloc = Wind6month[,3]
dim(Y.ob) #4320*9, data at 9 locations, with length 4320 (hours)
length(Y.newloc) #4320, time series at the new location



