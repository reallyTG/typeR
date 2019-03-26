library(pvar)


### Name: BridgeT
### Title: Bridge transformation
### Aliases: BridgeT

### ** Examples

x <- rnorm(1000)
Bx <- BridgeT(x, FALSE)

op <- par(mfrow=c(2,1),mar=c(4,4,2,1))
plot(cumsum(x), type="l")
plot(Bx, type="l")
par(op)



