library(FSAdata)


### Name: DarterOnt
### Title: Ages and lengths of Channel Darters from two locations.
### Aliases: DarterOnt
### Keywords: datasets

### ** Examples

data(DarterOnt)
str(DarterOnt)
head(DarterOnt)
op <- par(mfrow=c(1,2),pch=19)
plot(tl~age,data=DarterOnt,subset=river=="Salmon",main="Salmon R.")
plot(tl~age,data=DarterOnt,subset=river=="Trent",main="Trent R.")
par(op)




