library(sensiPhy)


### Name: clade_physig
### Title: Influential clade detection - Phylogenetic signal
### Aliases: clade_physig

### ** Examples

data(alien)
alien.data<-alien$data
alien.phy<-alien$phy
# Logtransform data
alien.data$logMass <- log(alien.data$adultMass) 
# Run sensitivity analysis:
clade <- clade_physig(trait.col = "logMass", data = alien.data, n.sim = 20,
                 phy = alien.phy[[1]], clade.col = "family", method = "K")
summary(clade)
sensi_plot(clade, "Bovidae")
sensi_plot(clade, "Sciuridae")



