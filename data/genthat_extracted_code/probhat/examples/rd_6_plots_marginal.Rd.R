library(probhat)


### Name: rd_6_plots_marginal
### Title: Plots of Marginal Distributions
### Aliases: plot.marginal

### ** Examples

data (trees)
trees = as.matrix (trees)
nppdfmv.f = nppdfmv (trees)
muv = marginal (nppdfmv.f)
plot (muv, 3, 1, TRUE)



