library(FSAdata)


### Name: HerringBWE
### Title: Stock and recruitment data for Blackwater Estuary Herring,
###   1962-1997.
### Aliases: HerringBWE
### Keywords: datasets

### ** Examples

data(HerringBWE)
str(HerringBWE)
head(HerringBWE)
op <- par(mfrow=c(1,2))
plot(recruits~spawning.year,data=HerringBWE,type="l")
plot(recruits~ssb,data=HerringBWE)
par(op)




