library(FSAdata)


### Name: YPerchSB
### Title: Stock and recruitment data for Yellow Perch from South Bay, Lake
###   Huron, 1950-1983.
### Aliases: YPerchSB
### Keywords: datasets

### ** Examples

data(YPerchSB)
str(YPerchSB)
head(YPerchSB)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=YPerchSB,type="b")
plot(recruits~stock,data=YPerchSB)
par(op)




