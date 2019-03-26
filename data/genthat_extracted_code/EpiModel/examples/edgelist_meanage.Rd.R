library(EpiModel)


### Name: edgelist_meanage
### Title: Mean Age of Partnerships over Time
### Aliases: edgelist_meanage
### Keywords: internal netUtils

### ** Examples

# Initialize and parameterize the network model
nw <- network.initialize(n = 100, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)

# Model estimation
est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

# Simulate the network and extract a timed edgelist
dx <- netdx(est, nsims = 1, nsteps = 100, keep.tedgelist = TRUE, verbose = FALSE)
el <- as.data.frame(dx)

# Calculate ages directly from edgelist
mean_ages <- edgelist_meanage(el = el)
mean_ages

# Alternatively, netdx calculates these
dx$pages
identical(dx$pages[[1]], mean_ages)




