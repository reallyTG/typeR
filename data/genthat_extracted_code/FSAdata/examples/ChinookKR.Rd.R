library(FSAdata)


### Name: ChinookKR
### Title: Stock and recruitment data for Klamath River Chinook Salmon,
###   1979-2000.
### Aliases: ChinookKR
### Keywords: datasets

### ** Examples

data(ChinookKR)
str(ChinookKR)
head(ChinookKR)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~brood.year,data=ChinookKR,type="l")
plot(recruits~spawners,data=ChinookKR)
par(op)




