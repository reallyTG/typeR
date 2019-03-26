library(FSAdata)


### Name: SockeyeKL
### Title: Stock and recruitment data for Sockeye Salmon from Karluk Lake,
###   AK, 1921-1948.
### Aliases: SockeyeKL
### Keywords: datasets

### ** Examples

data(SockeyeKL)
str(SockeyeKL)
head(SockeyeKL)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=SockeyeKL,type="b")
plot(recruits~stock,data=SockeyeKL)
par(op)




