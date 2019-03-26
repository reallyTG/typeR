library(motmot.2.0)


### Name: phyloCovar
### Title: Calculation of Brownian (co)variance using independent
###   contrasts.
### Aliases: phyloCovar

### ** Examples

data(anolis.tree)
data(anolis.data)
## calculate Brownian variance of female SVL
female.svl <- matrix(anolis.data[,"Female_SVL"], 
dimnames=list(rownames(anolis.data)))
input.data <- sortTraitData(phy=anolis.tree, y=female.svl, log.trait=TRUE)
phyloCovar(x=input.data$trait, phy = input.data$phy)



