library(FSAdata)


### Name: Hake
### Title: Stock and recruitment data for Hake, 1982-1996.
### Aliases: Hake
### Keywords: datasets

### ** Examples

data(Hake)
str(Hake)
head(Hake)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=Hake,type="l")
plot(recruits~spawn.biomass,data=Hake)
par(op)




