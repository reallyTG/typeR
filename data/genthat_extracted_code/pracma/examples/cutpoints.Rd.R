library(pracma)


### Name: cutpoints
### Title: Find Cutting Points
### Aliases: cutpoints
### Keywords: timeseries

### ** Examples

N <- 100; x <- sort(runif(N))
cp <- cutpoints(x, 6, 0.9)
n <- length(cp$cutp)

# Print out
nocp <- rle(findInterval(x, c(-Inf, cp$cutp, Inf)))$lengths
cbind(c(-Inf, cp$cutp), c(cp$cutp, Inf), nocp)

# Define a factor from the cutting points
fx <- cut(x, breaks = c(-Inf, cp$cutp, Inf))

## Not run: 
##D # Plot points and cutting points
##D plot(x, rep(0, N), col="gray", ann = FALSE)
##D points(cp$cutp, rep(0, n), pch="|", col=2)
##D 
##D # Compare with k-means clustering
##D km <- kmeans(x, n)
##D points(x, rep(0, N), col = km$cluster, pch = "+")
##D 
##D ##  A 2-dimensional example
##D x <- y <- c()
##D for (i in 1:9) {
##D   for (j in 1:9) {
##D     x <- c(x, i + rnorm(20, 0, 0.2))
##D     y <- c(y, j + rnorm(20, 0, 0.2))
##D   }
##D }
##D cpx <- cutpoints(x, 8, 0)
##D cpy <- cutpoints(y, 8, 0)
##D 
##D plot(x, y, pch = 18, col=rgb(0.5,0.5,0.5), axes=FALSE, ann=FALSE)
##D for (xi in cpx$cutp) abline(v=xi, col=2, lty=2)
##D for (yi in cpy$cutp) abline(h=yi, col=2, lty=2)
##D 
##D km <- kmeans(cbind(x, y), 81)
##D points(x, y, col=km$cluster)
## End(Not run)



