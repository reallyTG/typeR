library(RM2)


### Name: PD
### Title: Unconstrain the demand using the Projection-Detruncation
###   algorithm
### Aliases: PD
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
PD(demand)
PD(demand, tau=0.5, eps=0.005)
PD(demand, tau=0.5, eps=0.00005)
# MODIFY DEMAND VECTOR - NO CONSTRAINED INSTANCES ARE OBSERVED
names(demand) <- rep(0, length(demand))
# ATTEMPT TO UNTRUNCATE THE DEMAND
PD(demand, tau=0.5, eps=0.005)



