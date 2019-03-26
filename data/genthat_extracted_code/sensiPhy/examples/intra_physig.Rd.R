library(sensiPhy)


### Name: intra_physig
### Title: Intraspecific variability - Phylogenetic signal
### Aliases: intra_physig

### ** Examples

## Not run: 
##D data(alien)
##D alien.data<-alien$data
##D alien.phy<-alien$phy
##D # Run sensitivity analysis:
##D intra <- intra_physig(trait.col = "gestaLen", V = "SD_gesta" ,
##D                      data = alien.data, phy = alien.phy[[1]])
##D summary(intra)
##D sensi_plot(intra)
##D sensi_plot(intra, graphs = 1)
##D sensi_plot(intra, graphs = 2)
## End(Not run)

## Don't show: 
data(alien)
# Run sensitivity analysis:
intra <- intra_physig(trait.col = "gestaLen", V = "SD_gesta" ,
                     data = alien.data, n.intra = 5,
                     phy = alien.phy[[1]])
summary(intra)
## End(Don't show)



