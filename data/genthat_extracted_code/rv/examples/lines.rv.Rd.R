library(rv)


### Name: lines.rv
### Title: Add Connected (Random) Line Segments to a Plot
### Aliases: lines.rv
### Keywords: aplot

### ** Examples

## Not run: 
##D  
##D   x <- as.rv(1:10)
##D   y <- rvnorm(mean=x)
##D   par(mfrow=c(2,2))
##D   plot(x, y, type="b", main="Intervals and random lines", rvcol="blue", col="gray")
##D   plot(x, y, type="l", main="Only random lines", col="gray")
##D   plot(x, E(y), type="b", main="Means, connected by a constant line", col="gray")
##D   plot(x, rvmedian(y), type="b", pch=19, main="Median & middle 95 pc CI band", col="darkgray")
##D   lines(rvquantile(y, 0.025), col="gray")
##D   lines(rvquantile(y, 1-0.025), col="gray")
##D   
## End(Not run)




