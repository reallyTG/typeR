library(lmomco)


### Name: pp
### Title: Plotting-Position Formula
### Aliases: pp
### Keywords: plotting position

### ** Examples

Q <- rnorm(20)
PP <- pp(Q)
plot(PP,sort(Q))

Q <- rweibull(30,1.4,scale=400)
WEI <- parwei(lmoms(Q))
PP <- pp(Q)
plot(PP,sort(Q))
lines(PP,quawei(PP,WEI))

# This plot looks similar, but when connecting lines are added
# the nature of the sorting is obvious.
plot(pp(Q,sort=FALSE), Q)
lines(pp(Q,sort=FALSE), Q, col=2)




