library(motmot.2.0)


### Name: likTraitPhylo
### Title: Log-likelihood rate estimation for traits and phylogenies
### Aliases: likTraitPhylo

### ** Examples

data(anolis.tree)
data(anolis.data)
## calculate Brownian variance log-likelihood of female SVL
female.svl <- matrix(anolis.data[,"Female_SVL"], 
dimnames=list(rownames(anolis.data)))
input.data <- sortTraitData(phy=anolis.tree, y=female.svl, log.trait=TRUE)
likTraitPhylo(phy = input.data$phy, y=input.data$trait)



