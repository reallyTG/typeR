library(FSAdata)


### Name: YPerchCB2
### Title: Stock and recruitment data for Yellow Perch in Chequamegon Bay,
###   1975-1986.
### Aliases: YPerchCB2
### Keywords: datasets

### ** Examples

data(YPerchCB2)
str(YPerchCB2)
head(YPerchCB2)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~yrclass,data=YPerchCB2,type="b")
plot(recruits~stock,data=YPerchCB2)
par(op)




