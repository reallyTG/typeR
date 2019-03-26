library(sensiPhy)


### Name: tree_influ_phylm
### Title: Interaction between phylogenetic uncertainty and influential
###   species detection - Phylogenetic Linear Regression
### Aliases: tree_influ_phylm

### ** Examples

## Not run: 
##D # Load data:
##D data(alien)
##D # run analysis:
##D tree_influ <- tree_influ_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy, 
##D data = alien$data, n.tree = 5)
##D # To check summary results:
##D summary(tree_influ)
##D # Visual diagnostics
##D sensi_plot(tree_influ)
##D sensi_plot(tree_influ, graphs = 1)
##D sensi_plot(tree_influ, graphs = 2)
##D 
##D data(alien)
##D tree_influ <- tree_influ_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy, 
##D data = alien$data[1:25, ], n.tree = 2)
##D summary(tree_influ)
## End(Not run)



