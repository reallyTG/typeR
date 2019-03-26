library(probhat)


### Name: rd_5_plots_bivariate
### Title: Plots of Bivariate Distributions
### Aliases: plot.nppdfmv plot.npcdfmv plot.chained.npcdfmv.inverse

### ** Examples

data (trees)

#matrix with height and volume
trees.sub = as.matrix (trees)[,2:3]

nppdfmv.f = nppdfmv (trees.sub)
plot (nppdfmv.f)



