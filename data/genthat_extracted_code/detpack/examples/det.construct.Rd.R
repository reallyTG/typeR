library(detpack)


### Name: det.construct
### Title: Distribution Element Tree (DET) Construction
### Aliases: det.construct

### ** Examples

## Gaussian mixture data
require(stats)
det <- det.construct(t(c(rnorm(1e5),rnorm(1e4)/100+2))) # default linear det (mode = 2)
x <- t(seq(-4,6,0.01)); p <- det.query(det, x); plot(x, p, type = "l")

## piecewise uniform data with peaks
x <- matrix(c(rep(0,1e3),rep(1,1e3), 2*runif(1e4),
              rep(0,5e2),rep(1,25e2),2*runif(9e3)), nrow = 2, byrow = TRUE)
det <- det.construct(x, mode = 1, lb = 0, ub = 0) # constant elements, no pre-whitening



