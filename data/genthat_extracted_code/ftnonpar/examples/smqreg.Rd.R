library(ftnonpar)


### Name: smqreg
### Title: Smooth piecewise monotone regression with taut strings
### Aliases: smqreg
### Keywords: smooth nonparametric regression models

### ** Examples

data(djdata)
par(mfrow=c(2,2))
plot(djblocks,col="grey")
lines(smqreg(djblocks)$y,col="red")
plot(djbumps,col="grey")
lines(smqreg(djbumps)$y,col="red")
plot(djheavisine,col="grey")
lines(smqreg(djheavisine)$y,col="red")
plot(djdoppler,col="grey")
lines(smqreg(djdoppler)$y,col="red")



