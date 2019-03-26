library(motmot.2.0)


### Name: traitData.plot
### Title: plot a univariate continuous trait data on a phylogeny
### Aliases: traitData.plot

### ** Examples

data(anolis.tree)
data(anolis.data)
attach(anolis.data)
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
sortedData <- sortTraitData(anolis.tree, male.length)
phy <- sortedData$phy
male.length <- sortedData$trait
traitData.plot(y=male.length, phy)



