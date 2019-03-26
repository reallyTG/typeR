library(pracma)


### Name: hampel
### Title: Hampel Filter
### Aliases: hampel
### Keywords: timeseries

### ** Examples

set.seed(8421)
x <- numeric(1024)
z <- rnorm(1024)
x[1] <- z[1]
for (i in 2:1024) {
	x[i] <- 0.4*x[i-1] + 0.8*x[i-1]*z[i-1] + z[i]
}
omad <- hampel(x, k=20)

## Not run: 
##D plot(1:1024, x, type="l")
##D points(omad$ind, x[omad$ind], pch=21, col="darkred")
##D grid()
## End(Not run)



