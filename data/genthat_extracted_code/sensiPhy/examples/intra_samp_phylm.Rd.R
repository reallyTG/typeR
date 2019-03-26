library(sensiPhy)


### Name: intra_samp_phylm
### Title: Interaction between intraspecific variability and species
###   sampling - Phylogenetic Linear Regression
### Aliases: intra_samp_phylm

### ** Examples

## Not run: 
##D # Load data:
##D data(alien)
##D # Run analysis:
##D samp <- intra_samp_phylm(gestaLen ~ adultMass, phy = alien$phy[[1]],
##D                          y.transf = log,x.transf = NULL,Vy="SD_gesta",Vx=NULL,
##D                          data = alien$data, n.intra = 5, n.sim=10)
##D summary(samp)
##D head(samp$sensi.estimates)
##D # Visual diagnostics
##D sensi_plot(samp)
##D # You can specify which graph and parameter ("estimate" or "intercept") to print: 
##D sensi_plot(samp, graphs = 1)
##D sensi_plot(samp, graphs = 2)
## End(Not run)



