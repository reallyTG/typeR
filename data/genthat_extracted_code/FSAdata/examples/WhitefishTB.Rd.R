library(FSAdata)


### Name: WhitefishTB
### Title: Stock and recruitment data for Lake Whitefish in Thunder Bay,
###   Lake Superior, 1975-1988.
### Aliases: WhitefishTB
### Keywords: datasets

### ** Examples

data(WhitefishTB)
str(WhitefishTB)
head(WhitefishTB)
op <- par(mfrow=c(1,2),pch=19)
plot(rec~year,data=WhitefishTB,type="b")
plot(rec~ssb,data=WhitefishTB)
par(op)




