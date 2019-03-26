library(splus2R)


### Name: peaks
### Title: Local maxima
### Aliases: peaks
### Keywords: utilities

### ** Examples

x <- as.vector(sunspots)
z <- peaks(x, span=51)
plot(x, type="l")
abline(v=which(z), col="red", lty="dashed")



