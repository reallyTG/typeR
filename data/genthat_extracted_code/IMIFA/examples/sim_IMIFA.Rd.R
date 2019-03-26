library(IMIFA)


### Name: sim_IMIFA
### Title: Simulate Data from a Mixture of Factor Analysers Structure
### Aliases: sim_IMIFA sim_IMIFA_data sim_IMIFA_model
### Keywords: utility

### ** Examples

# Simulate 100 observations from 3 balanced clusters with cluster-specific numbers of latent factors
# Specify isotropic uniquenesses within each cluster
# Supply cluster means directly
sim_data <- sim_IMIFA_data(N=100, G=3, P=20, Q=c(2, 2, 5), psi=1:3,
                           mu=matrix(rnorm(60, -2 + 1:3, 1), nrow=20, ncol=3, byrow=TRUE))
names(attributes(sim_data))
labels   <- attr(sim_data, "Labels")

# Visualise the data in two-dimensions
plot(cmdscale(dist(sim_data), k=2), col=labels)

# Examine the overlap with a pairs plot of 5 randomly chosen variables
pairs(sim_data[,sample(1:20, 5)], col=labels)

# Fit a MIFA model to this data
# tmp    <- mcmc_IMIFA(sim_data, method="MIFA", range.G=3, n.iters=5000)



