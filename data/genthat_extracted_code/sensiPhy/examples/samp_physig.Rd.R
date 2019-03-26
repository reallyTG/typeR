library(sensiPhy)


### Name: samp_physig
### Title: Sensitivity Analysis Species Sampling - Phylogenetic signal
### Aliases: samp_physig

### ** Examples

## Not run: 
##D data(alien)
##D alien.data<-alien$data
##D alien.phy<-alien$phy
##D # Logtransform data
##D alien.data$logMass <- log(alien.data$adultMass) 
##D # Run sensitivity analysis:
##D samp <- samp_physig(trait.col = "logMass", data = alien.data, n.sim = 30,
##D phy = alien.phy[[1]])
##D summary(samp)
##D sensi_plot(samp)
##D sensi_plot(samp, graphs = 1)
##D sensi_plot(samp, graphs = 2)
## End(Not run)
## Don't show: 
data(alien)
# Logtransform data
alien.data$logMass <- log(alien.data$adultMass) 
# Run sensitivity analysis:
samp <- samp_physig(trait.col = "logMass", data = alien.data, 
n.sim = 3, phy = alien.phy[[1]])
summary(samp)
sensi_plot(samp)
sensi_plot(samp, graphs = 1)
sensi_plot(samp, graphs = 2)
## End(Don't show)



