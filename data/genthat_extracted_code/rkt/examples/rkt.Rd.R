library(rkt)


### Name: rkt
### Title: Mann Kendall test and Seasonal and Regional Kendall tests
###   (SKT/RKT)
### Aliases: rkt
### Keywords: ts nonparametric

### ** Examples

#
# monthly data
#
data(pie1)
ex<-rkt(pie1$Year,pie1$SO4,pie1$Month,pie1$mm,TRUE)
print(ex)
#
# weekly data, no intrablock correction
#

data(pie1w)
ex<-rkt(pie1w$Date,pie1w$SO4)
print(ex)
#
# monthly data, hydrological years (oct-sep) as in USGS program
#
data(pie1)
ex<-rkt(pie1$Year+floor(pie1$Month/10),pie1$SO4,pie1$Month,,TRUE)
print(ex)



