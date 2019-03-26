library(EpiModel)


### Name: as.data.frame.netdx
### Title: Extract Timed Edgelists netdx Objects
### Aliases: as.data.frame.netdx
### Keywords: extract

### ** Examples

# Initialize and parameterize the network model
nw <- network.initialize(n = 100, directed = FALSE)
formation <- ~edges
target.stats <- 50
coef.diss <- dissolution_coefs(dissolution = ~offset(edges), duration = 20)

# Model estimation
est <- netest(nw, formation, target.stats, coef.diss, verbose = FALSE)

# Simulate the network with netdx
dx <- netdx(est, nsims = 3, nsteps = 10, keep.tedgelist = TRUE, verbose = FALSE)

# Extract data from the first simulation
as.data.frame(dx, sim = 1)

# Extract data from all simulations
as.data.frame(dx)




