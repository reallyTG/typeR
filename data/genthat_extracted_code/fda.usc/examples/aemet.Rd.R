library(fda.usc)


### Name: aemet
### Title: aemet data
### Aliases: aemet
### Keywords: datasets

### ** Examples

data(aemet)
names(aemet)
names(aemet$df)
par(mfrow=c(3,1))
plot(aemet$temp)
plot(aemet$wind.speed)
plot(aemet$logprec)


