library(FSAdata)


### Name: CiscoTL
### Title: Lengths, weights, and sex of Cisco from Trout Lake, WI.
### Aliases: CiscoTL
### Keywords: datasets

### ** Examples

data(CiscoTL)
str(CiscoTL)
head(CiscoTL)
op <- par(mfrow=c(2,2),pch=19)
plot(weight~length,data=CiscoTL,subset=sex=="F",main="Female")
plot(weight~length,data=CiscoTL,subset=sex=="M",main="Male")
plot(weight~length,data=CiscoTL,subset=sex=="I",main="Immature")
par(op)




