library(sensiPhy)


### Name: tree_physig
### Title: Phylogenetic uncertainty - Phylogenetic signal
### Aliases: tree_physig

### ** Examples

# Load data:
data(alien)
alien.data<-alien$data
alien.phy<-alien$phy
# Logtransform data
alien.data$logMass <- log(alien.data$adultMass) 
# Run sensitivity analysis:
tree <- tree_physig(trait.col = "logMass", data = alien.data, 
phy = alien.phy, n.tree = 10)
summary(tree)
sensi_plot(tree)
sensi_plot(tree, graphs = 1)
sensi_plot(tree, graphs = 2)



