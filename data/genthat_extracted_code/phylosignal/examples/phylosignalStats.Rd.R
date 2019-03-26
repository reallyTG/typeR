library(phylosignal)


### Name: phyloSignal
### Title: Computes phylogenetic signal with different methods
### Aliases: phyloSignal

### ** Examples

require(ape)
require(phylobase)
data(navic)
tipData(navic)$rand <- rnorm(17)
tipData(navic)$BM <- rTraitCont(as(navic, "phylo"))
phyloSignal(navic)




