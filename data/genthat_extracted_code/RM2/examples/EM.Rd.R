library(RM2)


### Name: EM
### Title: Unconstrain the demand using the Expectation-Maximization
###   algorithm
### Aliases: EM
### Keywords: optimize

### ** Examples

# SPECIFY THE SEED
set.seed(333)
# SPECIFY REAL PARAMETERS OF THE DEMAND DISTRIBUTION
rmean <- 20
rsd <- 4
nrn <- 20
# GENERATE REAL DEMAND
rdemand <- round(rnorm(nrn, rmean, rsd))
# GENERATE BOOKING LIMITS
bl <- round(rnorm(nrn, rmean, rsd))
# GENERATE OBSERVED DEMAND
demand <- rdemand * (rdemand <= bl) + bl * (rdemand > bl)
# IDENTIFIED PERIODS WITH CONSTRAINED DEMAND: 1 - CONSTRAINED DEMAND
names(demand) <- as.character(as.numeric(rdemand>bl))
demand
# UNTRUNCATE DEMAND
EM(demand)
EM(demand, eps=0.005)
EM(demand, eps=0.00005)
# MODIFY DEMAND VECTOR - NO CONSTRAINED INSTANCES ARE OBSERVED
names(demand) <- rep(0, length(demand))
# ATTEMPT TO UNTRUNCATE THE DEMAND
EM(demand, eps=0.005)



