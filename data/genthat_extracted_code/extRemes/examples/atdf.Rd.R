library(extRemes)


### Name: atdf
### Title: Auto-Tail Dependence Function
### Aliases: atdf plot.atdf
### Keywords: ts univar hplot

### ** Examples

z <- arima.sim(n = 63, list(ar = c(0.8897, -0.4858), ma = c(-0.2279, 0.2488)),
               sd = sqrt(0.1796))
hold <- atdf(z, 0.8, plot=FALSE)
par(mfrow=c(2,2))
acf(z, xlab="")
pacf(z, xlab="")
plot(hold, type="chi")
plot(hold, type="chibar")

y <- cbind(z[2:63], z[1:62])
y <- apply(y, 1, max)
hold2 <- atdf(y, 0.8, plot=FALSE)
par(mfrow=c(2,2))
acf(y, xlab="")
pacf(y, xlab="")
plot(hold2, type="chi")
plot(hold2, type="chibar")

## Not run: 
##D data(Fort)
##D atdf(Fort[,5], 0.9)
##D 
##D data(Tphap)
##D atdf(Tphap$MaxT, 0.8)
##D 
##D data(PORTw)
##D atdf(PORTw$TMX1, u=0.9)
##D atdf(PORTw$TMX1, u=0.8)
## End(Not run)



