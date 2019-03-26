library(FSAdata)


### Name: WalleyeMN06a
### Title: Catch-at-age for Walleye.
### Aliases: WalleyeMN06a
### Keywords: datasets

### ** Examples

data(WalleyeMN06a)
str(WalleyeMN06a)
head(WalleyeMN06a)
op <- par(mfrow=c(2,2),pch=19)
plot(log(number)~age,data=WalleyeMN06a,subset=lake=="Crooked")
plot(log(number)~age,data=WalleyeMN06a,subset=lake=="Fourmile")
plot(log(number)~age,data=WalleyeMN06a,subset=lake=="Island")
plot(log(number)~age,data=WalleyeMN06a,subset=lake=="Tom")
par(op)




