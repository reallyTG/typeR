library(xoi)


### Name: firstden
### Title: Distance to a crossover
### Aliases: firstden
### Keywords: distribution

### ** Examples


f1 <- firstden(1, L=200, n=201)
plot(f1, type="l", lwd=2, las=1,
     ylim=c(0,0.012), yaxs="i", xaxs="i", xlim=c(0,200))

f2 <- firstden(2.6, L=200, n=201)
lines(f2, col="blue", lwd=2)

f3 <- firstden(4.3, L=200, n=201)
lines(f3, col="red", lwd=2)

f4 <- firstden(7.6, L=200, n=201)
lines(f4, col="green", lwd=2)




