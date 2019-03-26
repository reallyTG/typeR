library(forecastSNSTS)


### Name: f
### Title: Compute f(delta) for a tvAR(p) process
### Aliases: f

### ** Examples

## Not run: 
##D ## because computation is quite time-consuming.
##D n <- 100
##D a <- list( function(u) {return(0.8+0.19*sin(4*pi*u))} )
##D sigma <- function (u) {return(1)}
##D 
##D Ns <- seq( floor((n/2)^(4/5)), floor(n^(4/5)),
##D            ceiling((floor(n^(4/5)) - floor((n/2)^(4/5)))/25) )
##D which.deltas <- c(0, 0.01, 0.05, 0.1, 0.15, 0.2, 0.4, 0.6)
##D P_max <- 7
##D H <- 1
##D m <- floor(n^(.85)/4)
##D 
##D # now replicate some results from Table 4 in Kley et al. (2017)
##D f( which.deltas, P_max, h = 1, n - m, Ns, m, a, sigma )
##D f( which.deltas, P_max, h = 5, n - m, Ns, m, a, sigma )
## End(Not run)



