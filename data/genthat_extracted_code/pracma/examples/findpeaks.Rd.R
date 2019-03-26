library(pracma)


### Name: findpeaks
### Title: Find Peaks
### Aliases: findpeaks
### Keywords: timeseries

### ** Examples

x <- seq(0, 1, len = 1024)
pos <- c(0.1, 0.13, 0.15, 0.23, 0.25, 0.40, 0.44, 0.65, 0.76, 0.78, 0.81)
hgt <- c(4, 5, 3, 4, 5, 4.2, 2.1, 4.3, 3.1, 5.1, 4.2)
wdt <- c(0.005, 0.005, 0.006, 0.01, 0.01, 0.03, 0.01, 0.01, 0.005, 0.008, 0.005)

pSignal <- numeric(length(x))
for (i in seq(along=pos)) {
	pSignal <- pSignal + hgt[i]/(1 + abs((x - pos[i])/wdt[i]))^4
}
findpeaks(pSignal, npeaks=3, threshold=4, sortstr=TRUE)

## Not run: 
##D plot(pSignal, type="l", col="navy")
##D grid()
##D x <- findpeaks(pSignal, npeaks=3, threshold=4, sortstr=TRUE)
##D points(x[, 2], x[, 1], pch=20, col="maroon")
## End(Not run)



