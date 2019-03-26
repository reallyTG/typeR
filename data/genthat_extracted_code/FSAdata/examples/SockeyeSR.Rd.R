library(FSAdata)


### Name: SockeyeSR
### Title: Stock and recruitment data for Skeena River Sockeye Salmon,
###   1940-1967.
### Aliases: SockeyeSR
### Keywords: datasets

### ** Examples

data(SockeyeSR)
str(SockeyeSR)
head(SockeyeSR)
SockeyeSR1 <- SockeyeSR[-12,]
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=SockeyeSR1,type="b")
plot(recruits~spawners,data=SockeyeSR1)
par(op)




