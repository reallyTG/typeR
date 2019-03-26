library(DTDA.ni)


### Name: plot.DTDAni
### Title: plot.DTDAni
### Aliases: plot.DTDAni

### ** Examples


## Not run: 
##D N <- 250
##D x0 <- runif(N)             # Original data
##D u0 <- runif(N, -0.25, 0.5) # Left-truncation times
##D tau <- 0.75                # Interval width
##D v0 <- u0 + tau
##D 
##D x <- x0[u0 <= x0 & x0 <= v0]
##D u <- u0[u0 <= x0 & x0 <= v0]
##D v <- v0[u0 <= x0 & x0 <= v0]
##D n <- length(x)  # Final sample size after the interval sampling
##D res <- DTDAni(x, u , tau)
##D plot(res)
##D plot(res, ecdf = TRUE)
## End(Not run)




