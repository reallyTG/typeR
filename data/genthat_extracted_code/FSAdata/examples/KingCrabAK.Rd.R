library(FSAdata)


### Name: KingCrabAK
### Title: Stock and recruitment data for Red King Crab in Alaska,
###   1960-2004.
### Aliases: KingCrabAK
### Keywords: datasets

### ** Examples

data(KingCrabAK)
str(KingCrabAK)
head(KingCrabAK)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=KingCrabAK,type="l")
plot(recruits~adults,data=KingCrabAK)
par(op)




