library(IMIFA)


### Name: plot.Results_IMIFA
### Title: Plotting output and parameters of inferential interest for IMIFA
###   and related models
### Aliases: plot.Results_IMIFA
### Keywords: main plotting

### ** Examples

# See the vignette associated with the package for more graphical examples:
# vignette("IMIFA", package = "IMIFA")

# data(olive)
# simIMIFA <- mcmc_IMIFA(olive, method="IMIFA")
# resIMIFA <- get_IMIFA_results(simIMIFA, z.avgsim=TRUE)

# Examine the posterior distribution(s) of the number(s) of clusters (G) &/or latent factors (Q)
# For the IM(I)FA and OM(I)FA methods, this also plots the trace of the active/non-empty clusters
# plot(resIMIFA, plot.meth="GQ")
# plot(resIMIFA, plot.meth="GQ", g=2)

# Plot clustering uncertainty (and, if available, the similarity matrix)
# plot(resIMIFA, plot.meth="zlabels", zlabels=olive$area)

# Visualise the posterior predictive reconstruction error
# plot(resIMIFA, plot.meth="errors", g=1)

# Compare histograms of the data vs. replicate draw from the posterior for the 1st variable
# plot(resIMIFA, plot.meth="errors", g=2, ind=1)

# Visualise empirical vs. estimated covariance error metrics
# plot(resIMIFA, plot.meth="errors", g=3)

# Look at the trace, density, posterior mean and correlation of various parameters of interest
# plot(resIMIFA, plot.meth="all", param="means", g=1)
# plot(resIMIFA, plot.meth="all", param="means", g=1, ind=2)
# plot(resIMIFA, plot.meth="all", param="scores")
# plot(resIMIFA, plot.meth="all", param="scores", by.fac=TRUE)
# plot(resIMIFA, plot.meth="all", param="loadings", g=1)
# plot(resIMIFA, plot.meth="all", param="loadings", g=1, heat.map=FALSE)
# plot(resIMIFA, plot.meth="parallel.coords", param="uniquenesses")
# plot(resIMIFA, plot.meth="all", param="pis", intervals=FALSE, partial=TRUE)
# plot(resIMIFA, plot.meth="all", param="alpha")



