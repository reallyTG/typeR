library(motmot.2.0)


### Name: sortTraitData
### Title: Sort data and remove missing entries for tree and trait data
### Aliases: sortTraitData

### ** Examples

data(anolis.tree)
data(anolis.data)
attach(anolis.data)
male.length <- matrix(Male_SVL, dimnames=list(rownames(anolis.data)))
any(is.na(male.length[,1]))
data.sorted <- sortTraitData(anolis.tree, male.length)
phy <- data.sorted[[1]]
male.length <- data.sorted[[2]]



