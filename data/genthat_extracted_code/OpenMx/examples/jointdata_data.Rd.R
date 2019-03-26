library(OpenMx)


### Name: jointdata
### Title: Joint Ordinal and continuous variables to be modeled together
### Aliases: jointdata
### Keywords: datasets

### ** Examples

data(jointdata)
par(mfrow=c(2, 3))
h <- lapply(jointdata, hist)
par(mfrow=c(1, 1))

plot(z2 ~ z1, jointdata)




