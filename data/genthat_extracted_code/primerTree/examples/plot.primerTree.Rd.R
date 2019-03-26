library(primerTree)


### Name: plot.primerTree
### Title: plot function for a primerTree object, calls plot_tree_ranks
### Aliases: plot.primerTree

### ** Examples

library(gridExtra)
library(directlabels)
#plot with all common ranks
plot(mammals_16S)

#plot only the class
plot(mammals_16S, 'class')

#plot the layout only
plot(mammals_16S, 'none')



