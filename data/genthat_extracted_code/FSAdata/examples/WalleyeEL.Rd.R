library(FSAdata)


### Name: WalleyeEL
### Title: Stock and recruitment data for Walleye from Escanaba Lake, WI,
###   1958-1992.
### Aliases: WalleyeEL
### Keywords: datasets

### ** Examples

data(WalleyeEL)
str(WalleyeEL)
head(WalleyeEL)
op <- par(mfrow=c(1,2),pch=19)
plot(age0~yrclass,data=WalleyeEL,type="l")
plot(age0~age5,data=WalleyeEL)
par(op)




