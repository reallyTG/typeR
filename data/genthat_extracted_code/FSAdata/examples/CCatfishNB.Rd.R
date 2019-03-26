library(FSAdata)


### Name: CCatfishNB
### Title: Catch-at-age of Channel Catfish from two sections of the Platte
###   River, NB.
### Aliases: CCatfishNB
### Keywords: datasets

### ** Examples

data(CCatfishNB)
str(CCatfishNB)
head(CCatfishNB)
op <- par(mfrow=c(1,2),pch=19)
plot(log(catch)~age,data=CCatfishNB,subset=loc=="Central",main="Central")
plot(log(catch)~age,data=CCatfishNB,subset=loc=="Lower",main="Lower")
par(op)




