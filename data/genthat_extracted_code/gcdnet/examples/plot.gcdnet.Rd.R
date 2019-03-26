library(gcdnet)


### Name: plot.gcdnet
### Title: Plot coefficients from a "gcdnet" object
### Aliases: plot.gcdnet
### Keywords: models regression

### ** Examples

data(FHT)
m1 = gcdnet(x=FHT$x,y=FHT$y)
par(mfrow=c(1,3))
plot(m1) # plots against the L1-norm of the coefficients
plot(m1,xvar="lambda",label=TRUE) # plots against the log-lambda sequence
plot(m1,color=TRUE)



