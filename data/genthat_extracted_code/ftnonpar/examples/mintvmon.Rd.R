library(ftnonpar)


### Name: mintvmon
### Title: Minimization of total variation
### Aliases: mintvmon
### Keywords: smooth nonparametric models

### ** Examples

data(djdata)
djdoppler.tv0 <- mintvmon(djdoppler,method=0)
djdoppler.tv1 <- mintvmon(djdoppler,method=1)
djdoppler.tv2 <- mintvmon(djdoppler)
par(mfrow=c(2,2))
plot(djdoppler,col="lightgrey")
plot(djdoppler,col="lightgrey")
lines(djdoppler.tv0$y,col="blue")
plot(djdoppler,col="lightgrey")
lines(djdoppler.tv1$y,col="green")
plot(djdoppler,col="lightgrey")
lines(djdoppler.tv2$y,col="red")



