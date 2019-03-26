library(primerTree)


### Name: plot_tree_ranks
### Title: plots a tree along with a series of taxonomic ranks
### Aliases: plot_tree_ranks

### ** Examples

library(gridExtra)
library(directlabels)
#plot all the common ranks
plot_tree_ranks(mammals_16S$tree, mammals_16S$taxonomy)
#plot specific ranks, with a larger dot size
plot_tree_ranks(mammals_16S$tree, mammals_16S$taxonomy,
  ranks=c('kingdom', 'class', 'family'), size=3)



