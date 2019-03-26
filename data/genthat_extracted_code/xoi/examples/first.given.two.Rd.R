library(xoi)


### Name: first.given.two
### Title: Location of first crossover given there are two
### Aliases: first.given.two
### Keywords: distribution

### ** Examples


f1 <- first.given.two(1, L=200, n=101)
plot(f1, type="l", lwd=2, las=1,
     ylim=c(0,0.011), yaxs="i", xaxs="i", xlim=c(0,200))

f2 <- first.given.two(2.6, L=200, n=101)
lines(f2, col="blue", lwd=2)

## Not run: 
##D f3 <- first.given.two(4.3, L=200, n=101)
##D lines(f3, col="red", lwd=2)
##D 
##D f4 <- first.given.two(7.6, L=200, n=101)
##D lines(f4, col="green", lwd=2)
## End(Not run)




