library(caper)


### Name: phylo.d
### Title: Calculates the phylogenetic D statistic
### Aliases: phylo.d print.phylo.d summary.phylo.d plot.phylo.d
### Keywords: utilities htest

### ** Examples

data(BritishBirds)
BritishBirds <- comparative.data(BritishBirds.tree, BritishBirds.data, binomial)
redPhyloD <- phylo.d(BritishBirds, binvar=Red_list)
print(redPhyloD)
plot(redPhyloD)



