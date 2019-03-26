library(sensiPhy)


### Name: intra_clade_phylm
### Title: Interaction between intraspecific variability and influential
###   clade detection - Phylogenetic Linear Regression
### Aliases: intra_clade_phylm

### ** Examples

## Not run: 
##D #load data
##D data(alien)
##D intra_clade <- intra_clade_phylm(gestaLen ~ adultMass, phy = alien$phy[[1]],
##D  data = alien$data, clade.col = "family", n.sim = 30, n.intra = 5, 
##D  y.transf = log, x.transf = log, Vy="SD_gesta")
##D summary(intra_clade)
##D sensi_plot(intra_clade)
##D sensi_plot(intra_clade, clade = "Bovidae", graphs = 2)
##D sensi_plot(intra_clade, clade = "Mustelidae", graphs = 2)
## End(Not run)
## Don't show: 
data(alien)
intra_clade <- intra_clade_phylm(gestaLen ~ adultMass, phy = alien$phy[[1]],
                                data = alien$data, clade.col = "family", n.sim = 1, n.intra = 1, 
                                y.transf = log, x.transf = log, Vy="SD_gesta")
summary(intra_clade)
## End(Don't show)



