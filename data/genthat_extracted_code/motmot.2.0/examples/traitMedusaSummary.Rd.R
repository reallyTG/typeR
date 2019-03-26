library(motmot.2.0)


### Name: traitMedusaSummary
### Title: Identify shifts in the rate of trait diversification
### Aliases: traitMedusaSummary

### ** Examples

data(anolis.tree)
data(anolis.data)
attach(anolis.data)
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
sortedData <- sortTraitData(anolis.tree, male.length)
phy <- sortedData$phy
male.length <- sortedData$trait
phy.clade <- extract.clade(phy, 182)
male.length.clade <- as.matrix(male.length[match(phy.clade$tip.label, rownames(male.length)),])
tm1 <- transformPhylo.ML(male.length.clade, phy=phy.clade, model="tm1", minCladeSize=10, nSplits=1)
tm1_out <- traitMedusaSummary(tm1, cutoff=1)



