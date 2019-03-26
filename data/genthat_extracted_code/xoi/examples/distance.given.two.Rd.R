library(xoi)


### Name: distance.given.two
### Title: Distance between crossovers given there are two
### Aliases: distance.given.two
### Keywords: distribution

### ** Examples


f1 <- distance.given.two(1, L=200, n=101)
plot(f1, type="l", lwd=2, las=1,
     ylim=c(0,0.0122), yaxs="i", xaxs="i", xlim=c(0,200))

f2 <- distance.given.two(2.6, L=200, n=101)
lines(f2, col="blue", lwd=2)

## Not run: 
##D f3 <- distance.given.two(4.3, L=200, n=101)
##D lines(f3, col="red", lwd=2)
##D 
##D f4 <- distance.given.two(7.6, L=200, n=101)
##D lines(f4, col="green", lwd=2)
## End(Not run)




