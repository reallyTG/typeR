library(VineCopula)


### Name: D2RVine
### Title: Transform D-Vine to R-Vine Structure
### Aliases: D2RVine

### ** Examples

# set up D-vine copula model with mixed pair-copulas
d <- 4
dd <- d*(d-1)/2
order <- 1:d
family <- c(1, 2, 3, 4, 7, 3)
par <- c(0.5, 0.4, 2, 1.5, 1.2, 1.5)
par2 <- c(0, 5, 0, 0, 2, 0)

# transform to R-vine matrix notation
RVM <- D2RVine(order, family, par, par2)
## No test: 
# load package CDVine for comparison
library(CDVine)

# simulate a sample of size 500 from a 4-dimensional D-vine
type <- 2  # D-vine
simdata <- CDVineSim(500, family, par, par2, type)

# determine log-likelihood
out <- CDVineLogLik(simdata, family, par, par2, type)
out$loglik

# check that log-likelihood stays the same
out2 <- RVineLogLik(simdata, RVM)
out2$loglik
## End(No test)



