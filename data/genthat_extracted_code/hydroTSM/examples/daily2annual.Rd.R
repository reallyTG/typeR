library(hydroTSM)


### Name: (sub)daily2annual
### Title: (sub)Daily/Monthly -> Annual
### Aliases: daily2annual daily2annual.default daily2annual.zoo
###   daily2annual.data.frame daily2annual.matrix monthly2annual
###   monthly2annual.default monthly2annual.zoo monthly2annual.data.frame
###   monthly2annual.matrix subdaily2annual subdaily2annual.default
###   subdaily2annual.zoo subdaily2annual.data.frame subdaily2annual.matrix
### Keywords: manip

### ** Examples

######################
## Ex1: Loading the DAILY precipitation data at SanMartino
data(SanMartinoPPts)
x <- SanMartinoPPts

## Daily to Annual
daily2annual(x, FUN=sum, na.rm=TRUE)

######################
## Ex2: Monthly to Annual (same result as )
m <- daily2monthly(x, FUN=sum, na.rm=TRUE)
monthly2annual(m, FUN=sum, na.rm=TRUE)


######################
## Ex3: Loading the time series of HOURLY streamflows for the station Karamea at Gorge
data(KarameaAtGorgeQts)
x <- KarameaAtGorgeQts

# Sub-daily to monthly ts
subdaily2annual(x, FUN=mean, na.rm=TRUE)

############
## Ex4: Loading the monthly time series of precipitation within the Ebro River basin
data(EbroPPtsMonthly)

# computing the annual values for the first 10 gauging station in 'EbroPPtsMonthly'
a <- monthly2annual(EbroPPtsMonthly[,1:11], FUN=sum, dates=1)

# same as before, but with a nicer format of years
a <- monthly2annual(EbroPPtsMonthly[,1:11], FUN=sum, dates=1, out.fmt="%Y")



