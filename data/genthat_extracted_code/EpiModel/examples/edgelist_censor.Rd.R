library(EpiModel)


### Name: edgelist_censor
### Title: Table of Edge Censoring
### Aliases: edgelist_censor
### Keywords: netUtils

### ** Examples

# Initialize and parameterize network model
nw <- network.initialize(n = 100, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)

# Model estimation
est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

# Simulate the network and extract a timed edgelist
dx <- netdx(est, nsims = 1, nsteps = 100, keep.tedgelist = TRUE, verbose = FALSE)
el <- as.data.frame(dx)

# Calculate censoring
edgelist_censor(el)




