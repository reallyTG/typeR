library(sensiPhy)


### Name: clade_phylm
### Title: Influential clade detection - Phylogenetic Linear Regression
### Aliases: clade_phylm

### ** Examples

## Not run: 
##D # Load data:
##D data(primates)
##D # run analysis:
##D clade <- clade_phylm(log(sexMaturity) ~ log(adultMass), 
##D phy = primates$phy[[1]], data = primates$data, n.sim = 30, clade.col = "family")
##D # To check summary results and most influential clades:
##D summary(clade)
##D # Visual diagnostics for clade removal:
##D sensi_plot(clade)
##D # Specify which clade removal to plot:
##D sensi_plot(clade, "Cercopithecidae")
##D sensi_plot(clade, "Cebidae")
## End(Not run)



