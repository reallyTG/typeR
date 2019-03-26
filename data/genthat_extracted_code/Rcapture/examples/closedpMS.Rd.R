library(Rcapture)


### Name: closedpMS
### Title: Hierarchical Loglinear Model Selection in Closed Population
###   Capture-Recapture Experiments
### Aliases: closedpMS closedpMS.t print.closedpMS plot.closedpMS
###   getAllModels
### Keywords: models

### ** Examples

# Here is an example on the lesbian data set.

data(lesbian)

# This data set contains 4 capture occasions.
# By default, closedpMB.t fits the 113 following models:

getAllModels(4)

closedpMS.t(lesbian, dfreq = TRUE)

# We could reduce the number of models by omitting
# those with triple interactions.

closedpMS.t(lesbian, dfreq = TRUE, maxorder = 2)

# Models with heterogeneity fits better.

Darr <- closedpMS.t(lesbian, dfreq = TRUE, h = "Darroch")
Darr

# The plot method allows the visualization of the results
# from models fitted by closedpMS.t().

plot(Darr)

# According to the BIC, the best heterogeneous Darroch model
# for this data set contains the double interactions 12, 13, 14.
# Here is the profile likelihood confidence interval for the
# abundance estimation from this model.

closedpCI.t(lesbian, dfreq = TRUE, mX = "[12,13,14]", h = "Darroch")



