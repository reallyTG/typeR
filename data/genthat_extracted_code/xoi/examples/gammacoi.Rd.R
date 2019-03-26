library(xoi)


### Name: gammacoi
### Title: Coincidence function for the gamma model
### Aliases: gammacoi
### Keywords: distribution

### ** Examples


f1 <- gammacoi(1, L=200)
plot(f1, type="l", lwd=2, las=1,
     ylim=c(0,1.25), yaxs="i", xaxs="i", xlim=c(0,200))

f2 <- gammacoi(2.6, L=200)
lines(f2, col="blue", lwd=2)

f3 <- gammacoi(4.3, L=200)
lines(f3, col="red", lwd=2)

f4 <- gammacoi(7.6, L=200)
lines(f4, col="green", lwd=2)




