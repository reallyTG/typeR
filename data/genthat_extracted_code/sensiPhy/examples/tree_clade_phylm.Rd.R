library(sensiPhy)


### Name: tree_clade_phylm
### Title: Interaction between phylogenetic uncertainty and influential
###   clade detection - Phylogenetic Linear Regression
### Aliases: tree_clade_phylm

### ** Examples

## Not run: 
##D # Load data:
##D data(primates)
##D # run analysis:
##D clade_tree <- tree_clade_phylm(log(sexMaturity) ~ log(adultMass), 
##D phy = primates$phy, data = primates$data, clade.col = "family", n.sim = 50, n.tree = 5)
##D # To check summary results and most influential clades:
##D summary(clade_tree)
##D # Visual diagnostics for clade removal:
##D sensi_plot(clade_tree)
##D # Specify which clade removal to plot:
##D sensi_plot(clade_tree)
##D sensi_plot(clade_tree, "Cercopithecidae")
##D sensi_plot(clade_tree, clade = "Cebidae", graphs = 2)
## End(Not run)
## Don't show: 
data(primates)
# run analysis:
clade_tree <- tree_clade_phylm(log(sexMaturity) ~ log(adultMass), 
                              phy = primates$phy, data = primates$data, 
                              clade.col = "family", n.sim = 10, n.tree = 2)
# To check summary results and most influential clades:
summary(clade_tree)
## End(Don't show)



