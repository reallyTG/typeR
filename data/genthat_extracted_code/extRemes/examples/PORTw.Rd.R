library(extRemes)


### Name: PORTw
### Title: Annual Maximum and Minimum Temperature
### Aliases: PORTw SEPTsp
### Keywords: datasets

### ** Examples

data(PORTw)
str(PORTw)
par( mfrow=c(2,1))
plot(PORTw[,"TMX1"], type="l", lwd=2, xlab="", xaxt="n", ylab="Maximum Temperature (C)")
plot(PORTw[,"TMN0"], type="l", lwd=2, xlab="", xaxt="n", ylab="Minimum Temperature (C)")



