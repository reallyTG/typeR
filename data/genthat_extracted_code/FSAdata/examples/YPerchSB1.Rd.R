library(FSAdata)


### Name: YPerchSB1
### Title: Lengths for Yellow Perch from two locations in Saginaw Bay, Lake
###   Michigan.
### Aliases: YPerchSB1
### Keywords: datasets

### ** Examples

data(YPerchSB1)
str(YPerchSB1)
head(YPerchSB1)
op <- par(mfrow=c(1,2),pch=19)
with(subset(YPerchSB1,loc=="inner"),hist(tl,main="Inner"))
with(subset(YPerchSB1,loc=="outer"),hist(tl,main="Outer"))
par(op)




