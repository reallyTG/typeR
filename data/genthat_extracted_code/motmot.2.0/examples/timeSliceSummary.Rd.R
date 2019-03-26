library(motmot.2.0)


### Name: timeSliceSummary
### Title: Identify shifts in the rate of trait diversification through
###   time
### Aliases: timeSliceSummary

### ** Examples

data(anolis.tree)
data(anolis.data)
attach(anolis.data)
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
sortedData <- sortTraitData(anolis.tree, male.length)
phy <- sortedData$phy
male.length <- sortedData$trait
phy.clade <- extract.clade(phy, 182)
male.length.clade <- as.matrix(male.length[match(phy.clade$tip.label, 
rownames(male.length)),])
timeSlice.10.ml <- transformPhylo.ML(y=male.length.clade, phy=phy.clade, model="timeSlice", 
splitTime=c(10))
outputSummary <- timeSliceSummary(timeSlice.10.ml, cutoff=0.001, cex.tip=0.5, 
phylo.width=2, colour.ramp=c("blue", "red"))



