library(FSAdata)


### Name: BloaterLH
### Title: Stock and recruitment data for Lake Huron Bloaters, 1981-1996.
### Aliases: BloaterLH
### Keywords: datasets

### ** Examples

data(BloaterLH)
str(BloaterLH)
head(BloaterLH)
op <- par(mfrow=c(1,2),pch=19)
plot(eggs~year,data=BloaterLH,type="l")
plot(eggs~age3,data=BloaterLH)
par(op)




