library(ftnonpar)


### Name: genpmreg
### Title: Piecewise monotone regression with generalised taut strings
### Aliases: genpmreg
### Keywords: smooth nonparametric regression models robust

### ** Examples

data(djdata)
par(mfrow=c(2,2))
plot(djblocks,col="grey")
lines(genpmreg(djblocks,verbose=FALSE,method=2,thr.const=2.5)$y,col="red")
title("Usual taut string method")
ind <- sample(1:length(djblocks),300)
djblocks[ind] <- djblocks[ind]+rnorm(length(ind),0,100)
plot(djblocks,col="grey")
lines(genpmreg(djblocks,verbose=FALSE,method=2)$y,col="red")
title("Usual taut string method with outliers")
plot(djblocks,col="grey")
lines(genpmreg(djblocks,verbose=FALSE,method=1)$y,col="red")
title("Robust taut string method with outliers")
plot(djblocks,col="grey",ylim=c(-10,10))
lines(genpmreg(djblocks,verbose=FALSE,method=1)$y,col="red")
title("Again robust taut string method, different scaling of y-axis")



