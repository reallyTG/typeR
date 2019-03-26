library(FSAdata)


### Name: WShrimpGA
### Title: Stock and recruitment data for White Shrimp off the coast of
###   Georgia (USA), 1979-2000.
### Aliases: WShrimpGA
### Keywords: datasets

### ** Examples

data(WShrimpGA)
str(WShrimpGA)
head(WShrimpGA)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=WShrimpGA,type="b")
plot(recruits~stock,data=WShrimpGA)
par(op)




