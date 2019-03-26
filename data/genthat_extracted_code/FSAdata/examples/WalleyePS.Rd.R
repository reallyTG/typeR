library(FSAdata)


### Name: WalleyePS
### Title: Ages of Walleye assigned from otoliths, scales, and spines.
### Aliases: WalleyePS
### Keywords: datasets

### ** Examples

data(WalleyePS)
str(WalleyePS)
head(WalleyePS)
op <- par(mfrow=c(3,2),pch=19)
plot(scale~otolith,data=WalleyePS,subset=sex=="female",main="Female")
plot(scale~otolith,data=WalleyePS,subset=sex=="male",main="Male")
plot(scale~spine,data=WalleyePS,subset=sex=="female",main="Female")
plot(scale~spine,data=WalleyePS,subset=sex=="male",main="Male")
plot(spine~otolith,data=WalleyePS,subset=sex=="female",main="Female")
plot(spine~otolith,data=WalleyePS,subset=sex=="male",main="Male")
par(op)




