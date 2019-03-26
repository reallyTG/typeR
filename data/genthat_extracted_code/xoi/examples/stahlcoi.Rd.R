library(xoi)


### Name: stahlcoi
### Title: Coincidence function for the Stahl model
### Aliases: stahlcoi
### Keywords: distribution

### ** Examples


f1 <- stahlcoi(1, p=0, L=200)
plot(f1, type="l", lwd=2, las=1,
     ylim=c(0,1.25), yaxs="i", xaxs="i", xlim=c(0,200))

f2 <- stahlcoi(2.6, p=0, L=200)
lines(f2, col="blue", lwd=2)

f2s <- stahlcoi(2.6, p=0.1, L=200)
lines(f2s, col="blue", lwd=2, lty=2)

f3 <- stahlcoi(4.3, p=0, L=200)
lines(f3, col="red", lwd=2)

f3s <- stahlcoi(4.3, p=0.1, L=200)
lines(f3s, col="red", lwd=2, lty=2)

f4 <- stahlcoi(7.6, p=0, L=200)
lines(f4, col="green", lwd=2)

f4s <- stahlcoi(7.6, p=0.1, L=200)
lines(f4s, col="green", lwd=2, lty=2)




