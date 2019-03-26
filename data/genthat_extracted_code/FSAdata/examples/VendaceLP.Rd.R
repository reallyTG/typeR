library(FSAdata)


### Name: VendaceLP
### Title: Stock and recruitment data for Vendace from Lake Puulavesi,
###   1982-1996.
### Aliases: VendaceLP
### Keywords: datasets

### ** Examples

data(VendaceLP)
str(VendaceLP)
head(VendaceLP)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=VendaceLP,type="l")
plot(recruits~stock,data=VendaceLP)
par(op)




