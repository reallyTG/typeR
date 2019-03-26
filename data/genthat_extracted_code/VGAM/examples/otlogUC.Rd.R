library(VGAM)


### Name: Otlog
### Title: One-truncated Logarithmic Distribution
### Aliases: Otlog dotlog potlog qotlog rotlog
### Keywords: distribution

### ** Examples

dotlog(1:20, 0.5)
rotlog(20, 0.5)

## Not run: 
##D  shape <- 0.8; x <- 1:10
##D plot(x, dotlog(x, shape = shape), type = "h", ylim = 0:1,
##D      sub = "shape=0.8", las = 1, col = "blue", ylab = "Probability",
##D      main = "1-truncated logarithmic distribution: blue=PMF; orange=CDF")
##D lines(x + 0.1, potlog(x, shape = shape), col = "orange", lty = 3, type = "h") 
## End(Not run)



