library(hydrostats)


### Name: day.dist
### Title: Calculate average timing of events (doy)
### Aliases: day.dist

### ** Examples

days<-c(366,1,365,1,366)
years<-c("1968","1975","1983","1990","2004")
day.dist(days=days, years=years)

days<-c(170,180,1,365,170)
day.dist(days=days, years=years)

dates<-c("1968-06-18", "1975-06-29", "1983-01-01", "1990-12-31", "2004-06-18")
dates<-as.POSIXct(dates, format = "%Y-%m-%d", tz="")
day.dist(Dates=dates)




