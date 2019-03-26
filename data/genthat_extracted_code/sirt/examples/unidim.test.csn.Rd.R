library(sirt)


### Name: unidim.test.csn
### Title: Test for Unidimensionality of CSN
### Aliases: unidim.test.csn
### Keywords: Test for unidimensionality

### ** Examples

#############################################################################
# EXAMPLE 1: Dataset data.read
#############################################################################

data(data.read)
dat <- data.read
set.seed(778)
res <- sirt::unidim.test.csn( dat )
  ##  CSN Statistic=0.04737, p=0.02

## Not run: 
##D #############################################################################
##D # EXAMPLE 2: CSN statistic for two-dimensional simulated data
##D #############################################################################
##D 
##D set.seed(775)
##D N <- 2000
##D I <- 30   # number of items
##D rho <- .60   # correlation between 2 dimensions
##D t0 <- stats::rnorm(N)
##D t1 <- sqrt(rho)*t0 + sqrt(1-rho)*stats::rnorm(N)
##D t2 <- sqrt(rho)*t0 + sqrt(1-rho)*stats::rnorm(N)
##D dat1 <- sirt::sim.raschtype(t1, b=seq(-1.5,1.5,length=I/2) )
##D dat2 <- sirt::sim.raschtype(t2, b=seq(-1.5,1.5,length=I/2) )
##D dat <- as.matrix(cbind( dat1, dat2) )
##D res <- sirt::unidim.test.csn( dat )
##D   ##  CSN Statistic=0.06056, p=0.02
## End(Not run)



