library(FSAdata)


### Name: HerringISS
### Title: Stock and recruitment data for Icelandic summer spawning
###   Herring, 1946-1996.
### Aliases: HerringISS
### Keywords: datasets

### ** Examples

data(HerringISS)
str(HerringISS)
head(HerringISS)
op <- par(mfrow=c(1,2))
plot(rec~year,data=HerringISS,type="l")
plot(rec~ssb,data=HerringISS)
par(op)




