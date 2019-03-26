library(FSAdata)


### Name: WalleyeKS
### Title: Catch-at-age for Walleye from eight Kansas reservoirs.
### Aliases: WalleyeKS
### Keywords: datasets

### ** Examples

data(WalleyeKS)
str(WalleyeKS)
head(WalleyeKS)
op <- par(mfrow=c(2,2),mar=c(3,3,2,1),mgp=c(1.75,0.5,0),tcl=-0.2,pch=19)
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Cedar.Bluff"),main="Cedar Bluff")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Cheney"),main="Cheney")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Glen.Elder"),main="Glen Elder")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Kirwin"),main="Kirwin")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Lovewell"),main="Lovewell")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Marion"),main="Marion")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Webster"),main="Webster")
plot(log(catch)~age,data=WalleyeKS,subset=(reservoir=="Wilson"),main="Wilson")
par(op)




