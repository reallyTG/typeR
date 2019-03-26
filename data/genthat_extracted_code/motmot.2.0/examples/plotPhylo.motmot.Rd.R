library(motmot.2.0)


### Name: plotPhylo.motmot
### Title: Tree plotting for rates Plots trees with colours based on rates
###   of trait evolution. Also provides simple coloured plotting for trait
###   values using the "ace" function in the ape library.
### Aliases: plotPhylo.motmot

### ** Examples

# Data and phylogeny
data(anolis.tree)
data(anolis.data)

# female SVL data
female.svl <- matrix(anolis.data[,"Female_SVL"], 
dimnames=list(rownames(anolis.data)))
input.data <- sortTraitData(phy=anolis.tree, y=female.svl, log.trait=TRUE)

# arbitarily reduce data size for speed in this example
phy.clade <- extract.clade(input.data[[1]], 182)
male.length.clade <- as.matrix(input.data[[2]][match(input.data[[1]]$tip.label, 
rownames(input.data[[2]])),])
# Identify rate shifts and print and plot results with up to one rate shifts 
# and minimum clade size of 10.
anolisSVL_MEDUSA <- transformPhylo.ML(male.length.clade, phy=phy.clade, 
model="tm1",minCladeSize=10, nSplits=1)
anolisSVL_MEDUSA_out <- traitMedusaSummary(anolisSVL_MEDUSA,
cutoff=1, AICc=FALSE)
colours <- plotPhylo.motmot(phy=phy.clade, traitMedusaObject = anolisSVL_MEDUSA_out,
reconType = "rates", type = "fan", cex=0.6, edge.width=3)



