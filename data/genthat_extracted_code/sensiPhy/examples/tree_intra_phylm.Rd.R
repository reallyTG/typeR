library(sensiPhy)


### Name: tree_intra_phylm
### Title: Interaction between phylogenetic uncertainty and intraspecific
###   variability - Phylogenetic Linear Regression
### Aliases: tree_intra_phylm

### ** Examples

# Load data:
data(alien)
# run PGLS accounting for intraspecific and phylogenetic variation:
intra.tree <- tree_intra_phylm(gestaLen ~ adultMass, data = alien$data, phy = alien$phy,
Vy = "SD_gesta", n.intra = 3, n.tree = 3, y.transf = log, x.transf = log)
# To check summary results:
summary(intra.tree)
# Visual diagnostics
sensi_plot(intra.tree, uncer.type = "all") #or uncer.type = "tree", uncer.type = "intra"



