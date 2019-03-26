library(sensiPhy)


### Name: tree_phylm
### Title: Phylogenetic uncertainty - Phylogenetic Linear Regression
### Aliases: tree_phylm

### ** Examples

# Load data:
data(alien)
# This analysis needs a multiphylo file:
class(alien$phy)
alien$phy
# run PGLS accounting for phylogenetic uncertain:
tree <- tree_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy, 
data = alien$data, n.tree = 30)
# To check summary results:
summary(tree)
# Visual diagnostics
sensi_plot(tree)
# You can specify which graph to print: 
sensi_plot(tree, graphs = 3)



