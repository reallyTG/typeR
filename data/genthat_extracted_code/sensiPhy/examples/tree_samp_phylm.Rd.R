library(sensiPhy)


### Name: tree_samp_phylm
### Title: Interaction between phylogenetic uncertainty and sensitivity to
###   species sampling - Phylogenetic Linear Regression
### Aliases: tree_samp_phylm

### ** Examples

## Not run: 
##D # Load data:
##D data(alien)
##D # Run analysis:
##D samp <- tree_samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy,
##D                                     data = alien$data, n.tree = 5, n.sim=10)
##D summary(samp)
##D head(samp$sensi.estimates)
##D # Visual diagnostics
##D sensi_plot(samp)
##D sensi_plot(samp, graphs = 1)
##D sensi_plot(samp, graphs = 2)
## End(Not run)
## Don't show: 
# Load data:
data(alien)
# Run analysis:
samp <- tree_samp_phylm(log(gestaLen) ~ log(adultMass), phy = alien$phy,
                                    data = alien$data, n.tree = 2, n.sim=2)
summary(samp)
head(samp$sensi.estimates)
# Visual diagnostics
sensi_plot(samp)
sensi_plot(samp, graphs = 1)
sensi_plot(samp, graphs = 2)
## End(Don't show)



