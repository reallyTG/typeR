library(xoi)


### Name: location.given.one
### Title: Location of crossover given there is one
### Aliases: location.given.one
### Keywords: distribution

### ** Examples


f1 <- location.given.one(1, L=200, n=201)
plot(f1, type="l", lwd=2, las=1,
     ylim=c(0,0.006), yaxs="i", xaxs="i", xlim=c(0,200))

f2 <- location.given.one(2.6, L=200, n=201)
lines(f2, col="blue", lwd=2)

f3 <- location.given.one(4.3, L=200, n=201)
lines(f3, col="red", lwd=2)

f4 <- location.given.one(7.6, L=200, n=201)
lines(f4, col="green", lwd=2)




