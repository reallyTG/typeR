library(DTDA.ni)


### Name: DTDAni
### Title: Doubly Truncated Data Analysis, Non Iterative
### Aliases: DTDAni

### ** Examples

## Not run: 
##D # Generating data which are doubly truncated:
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
##D 
##D # Create an object with DTDAni function
##D res <- DTDAni(x, u, tau)
##D plot(res)
##D 
##D abline(a = 0, b = 1, col = "green")  #the true cumulative distribution
##D 
##D # Calculating the reverse estimator:
##D res2 <- DTDAni(-x, -u - tau, tau)
##D lines(-res2$x, 1 - res2$cumprob, type = "s", col = "blue", lty = 2)
##D 
##D # Weigthed estimator (recommended):
##D 
##D w <- 1/2
##D 
##D k <- length(res$x)
##D 
##D Fw <- w * res$cumprob + (1 - w) * (1 - res2$cumprob[k:1])
##D lines(res$x, Fw, type = "s", col = 2)
##D 
##D 
##D # Using res$P and res$L to compute the estimator:
##D 
##D k <- length(res$x)
##D F <- rep(1, k)
##D for (i in 2:k){
##D   F[i] <- (F[i - 1] - res$P[i - 1]) / res$L[i - 1] + res$P[i - 1]
##D }
##D 
##D F0 <- F/max(F)  # This is equal to res$cumprob
## End(Not run)




