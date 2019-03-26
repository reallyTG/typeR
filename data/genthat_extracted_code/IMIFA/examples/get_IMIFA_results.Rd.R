library(IMIFA)


### Name: get_IMIFA_results
### Title: Extract results, conduct posterior inference and compute
###   performance metrics for MCMC samples of models from the IMIFA family
### Aliases: get_IMIFA_results print.Results_IMIFA summary.Results_IMIFA
### Keywords: IMIFA main

### ** Examples

# data(coffee)
# data(olive)

# Run a MFA model on the coffee data over a range of clusters and factors.
# simMFAcoffee  <- mcmc_IMIFA(coffee, method="MFA", range.G=2:3, range.Q=0:3, n.iters=1000)

# Accept all defaults to extract the optimal model.
# resMFAcoffee  <- get_IMIFA_results(simMFAcoffee)

# Instead let's get results for a 3-cluster model, allowing Q be chosen by aic.mcmc.
# resMFAcoffee2 <- get_IMIFA_results(simMFAcoffee, G=3, criterion="aic.mcmc")

# Run an IMIFA model on the olive data, accepting all defaults.
# simIMIFAolive <- mcmc_IMIFA(olive, method="IMIFA", n.iters=10000)

# Extract optimum results
# Estimate G & Q by the median of their posterior distributions
# Construct 90% credible intervals and try to return the similarity matrix.
# resIMIFAolive <- get_IMIFA_results(simIMIFAolive, G.meth="median", Q.meth="median",
#                                    conf.level=0.9, z.avgsim=TRUE)
# summary(resIMIFAolive)

# Simulate new data from the above model
# newdata       <- sim_IMIFA_model(resIMIFAolive)



