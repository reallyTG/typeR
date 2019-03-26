library(FSAdata)


### Name: FHCatfishATL
### Title: Catch-at-age of Flathead Catfish from three Atlantic rivers.
### Aliases: FHCatfishATL
### Keywords: datasets

### ** Examples

data(FHCatfishATL)
str(FHCatfishATL)
head(FHCatfishATL)
op <- par(mfrow=c(2,2),pch=19)
plot(log(number)~age,data=FHCatfishATL,subset=river=="Lumber",main="Lumber")
plot(log(number)~age,data=FHCatfishATL,subset=river=="NCF",main="NCF")
plot(log(number)~age,data=FHCatfishATL,subset=river=="Neuse",main="Neuse")
par(op)




