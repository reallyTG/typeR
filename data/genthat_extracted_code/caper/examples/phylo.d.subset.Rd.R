library(caper)


### Name: phylo.d.subset
### Title: Calculates the phylogenetic D statistic across clades within a
###   phylogeny
### Aliases: phylo.d.subset print.phylo.d.subset summary.phylo.d.subset
### Keywords: utilities htest

### ** Examples

data(BritishBirds)
BritishBirds <- comparative.data(BritishBirds.tree, BritishBirds.data, binomial)
# Look at big clades only
## Not run: 
##D bigClades <- phylo.d.subset(BritishBirds, binvar=Red_list, verbose=TRUE, min.tips=10, min.nodes=5)
##D print(bigClades)
## End(Not run)



