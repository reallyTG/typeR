library(simba)


### Name: symbol.size
### Title: Little helper function to obtain bubble plots with simple plot
###   and points methods
### Aliases: symbol.size
### Keywords: aplot dplot iplot

### ** Examples

# load abisko data that comes with simba
data(abis)

# take the environmental data end plot species richness at the field plot positions
with(abis.env, {plot(X, Y, cex=symbol.size(n.spec))})

# make kind of a multivariate plot in 3d:
# the relation between shannon, evenness, and simpson index (bubble size)
with(abis.env, {plot(shannon, even, cex=symbol.size(simps, cex.max=8))})




