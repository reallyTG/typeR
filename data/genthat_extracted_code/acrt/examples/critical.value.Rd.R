library(acrt)


### Name: critical.value
### Title: Critical Values for Autocorrelation Robust Testing
### Aliases: critical.value

### ** Examples

## Not run: 
##D n <- 100
##D alpha <- .05
##D ar.order.max <- n-1
##D bandwidth <- 10
##D ker <- "Bartlett"
##D R <- matrix(c(0, 1), nrow = 1, ncol = 2)
##D X <- cbind(rep(1, length = n), rnorm(n))
##D N0 <- 1000
##D N1 <- 10000
##D N2 <- 50000
##D Mp <- 5000
##D M1 <- 10
##D M2 <- 2
##D 
##D critical.value(alpha, ar.order.max, bandwidth, ker, R, X, N0, N1, N2, Mp, M1, 
##D                M2)
## End(Not run)


