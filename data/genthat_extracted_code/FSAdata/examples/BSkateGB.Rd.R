library(FSAdata)


### Name: BSkateGB
### Title: Stock and recruitment data for Barndoor Skate from Georges Bank,
###   1966-2007.
### Aliases: BSkateGB
### Keywords: datasets

### ** Examples

data(BSkateGB)
str(BSkateGB)
head(BSkateGB)
op <- par(mfrow=c(3,2),pch=19)
plot(recruits~year,data=BSkateGB,subset=season=="fall",type="b",main="fall")
plot(recruits~spawners,data=BSkateGB,subset=season=="fall",main="fall")
plot(recruits~year,data=BSkateGB,subset=season=="spring",type="b",main="spring")
plot(recruits~spawners,data=BSkateGB,subset=season=="spring",main="spring")
plot(recruits~year,data=BSkateGB,subset=season=="winter",type="b",main="winter")
plot(recruits~spawners,data=BSkateGB,subset=season=="winter",main="winter")
par(op)




