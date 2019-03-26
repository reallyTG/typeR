library(SCBmeanfd)


### Name: plasma
### Title: Plasma citrate data
### Aliases: plasma
### Keywords: datasets

### ** Examples

## Not run: 
##D data(plasma)
##D matplot(x = 8:21, y = t(plasma), cex = .75, type = "l", col = 1, lty = 1,
##D   lwd = .5, xlab = "Time of day (hour)", ylab = "Concentration", 
##D   main = "Plasma citrate data")
##D lines(8:21, colMeans(plasma), col = 2, lwd = 1.5)
##D legend("topright", col = 2, lty = 1, lwd = 1.5, legend = "Mean")
## End(Not run)



