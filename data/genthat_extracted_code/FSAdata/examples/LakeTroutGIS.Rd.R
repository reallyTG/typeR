library(FSAdata)


### Name: LakeTroutGIS
### Title: Stock and recruitment data for Lake Trout from Gull Island
###   Shoal, Lake Superior, 1964-1991.
### Aliases: LakeTroutGIS
### Keywords: datasets

### ** Examples

data(LakeTroutGIS)
str(LakeTroutGIS)
head(LakeTroutGIS)
op <- par(mfrow=c(1,2))
plot(recruits~year,data=LakeTroutGIS,type="l")
plot(recruits~stock,data=LakeTroutGIS)
par(op)




