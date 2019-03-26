library(FSAdata)


### Name: YPerchGL
### Title: Lengths and weights of Yellow Perch from Grafton Lake (ME) by
###   year.
### Aliases: YPerchGL
### Keywords: datasets

### ** Examples

data(YPerchGL)
str(YPerchGL)
head(YPerchGL)
op <- par(mfrow=c(1,2),pch=19)
plot(w~fl,data=YPerchGL,subset=year==1994,main="1994")
plot(w~fl,data=YPerchGL,subset=year==2000,main="2000")
par(op)




