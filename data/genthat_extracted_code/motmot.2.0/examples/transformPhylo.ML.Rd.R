library(motmot.2.0)


### Name: transformPhylo.ML
### Title: Maximum likelihood for models of trait evoluion
### Aliases: transformPhylo.ML

### ** Examples

# Data and phylogeny
data(anolis.tree)
data(anolis.data)
attach(anolis.data)
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
sortedData <- sortTraitData(anolis.tree, male.length)
phy <- sortedData$phy
male.length <- sortedData$trait
phy.clade <- extract.clade(phy, 182)
male.length.clade <- as.matrix(male.length[match(phy.clade$tip.label, rownames(male.length)),])

# Brownian motion model
transformPhylo.ML(male.length.clade , phy=phy.clade, model="bm")

# Delta
transformPhylo.ML(male.length.clade , phy=phy.clade, model="delta", upperBound=2)

# The upper confidence interval for kappa is outside the bounds so try increasing
# the upper bound

transformPhylo.ML(male.length.clade , phy=phy.clade, model="delta", upperBound=5)

# Test for different rates in different clades - here with 2 hypothesised
# unusual rates compared to the background

# This fits the non-censored model of O'Meara et al. (2006)
phy.clade$node.label[which(phy.clade$node.label == "3")] <- 2
transformPhylo.ML(male.length.clade, phy=phy.clade, model="clade", nodeIDs=c(49, 54))

# Identify rate shifts and print and plot results with upto three rate shifts
# and minimum clade size of 20.
anolisSVL_MEDUSA <- transformPhylo.ML(male.length.clade, phy=phy.clade, model="tm1",
minCladeSize=10, nSplits=2)



