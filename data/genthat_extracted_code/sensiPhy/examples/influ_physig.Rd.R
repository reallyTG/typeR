library(sensiPhy)


### Name: influ_physig
### Title: Influential species detection - Phylogenetic signal
### Aliases: influ_physig

### ** Examples

## Don't show: 
# Load data:
data(alien)
alien.data<-alien$data
alien.phy<-alien$phy
# Logtransform data
alien.data$logMass <- log(alien.data$adultMass) 
# Run sensitivity analysis:
influ <- influ_physig("logMass", data = alien.data[1:20,],
phy = alien.phy[[1]])
# To check summary results:
summary(influ)
## End(Don't show)
## Not run: 
##D # Load data:
##D data(alien)
##D # Logtransform data
##D alien.data$logMass <- log(alien.data$adultMass) 
##D # Run sensitivity analysis:
##D influ <- influ_physig("logMass", data = alien.data, phy = alien.phy[[1]])
##D # To check summary results:
##D summary(influ)
##D # Most influential speciesL
##D influ$influential.species
##D # Visual diagnostics
##D sensi_plot(influ)
##D # You can specify which graph to print: 
##D sensi_plot(influ, graphs = 1)
##D sensi_plot(influ, graphs = 2)
## End(Not run)



