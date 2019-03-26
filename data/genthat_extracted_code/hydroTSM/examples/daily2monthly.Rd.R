library(hydroTSM)


### Name: (sub)daily2monthly
### Title: (sub)Daily -> Monthly
### Aliases: daily2monthly daily2monthly.default daily2monthly.zoo
###   daily2monthly.data.frame daily2monthly.matrix subdaily2monthly
###   subdaily2monthly.default subdaily2monthly.zoo
###   subdaily2monthly.data.frame subdaily2monthly.matrix
### Keywords: manip

### ** Examples

######################
## Ex1: Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts

## Daily to monthly
m <- daily2monthly(x, FUN=sum, na.rm=TRUE)

######################
## Ex2: Loading the time series of HOURLY streamflows for the station Karamea at Gorge
data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts

# Sub-daily to monthly ts
subdaily2monthly(x, FUN=mean, na.rm=TRUE)



