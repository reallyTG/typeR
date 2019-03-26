library(ade4)


### Name: palm
### Title: Phylogenetic and quantitative traits of amazonian palm trees
### Aliases: palm
### Keywords: datasets

### ** Examples

## Not run: 
##D data(palm)
##D palm.phy <- newick2phylog(palm$tre)
##D radial.phylog(palm.phy,clabel.l=1.25)
##D 
##D if (requireNamespace("adephylo", quietly = TRUE) & requireNamespace("ape", quietly = TRUE)) {
##D   tre <- ape::read.tree(text = palm$tre)
##D   adephylo::orthogram(palm$traits[, 4], tre)
##D }
##D dotchart.phylog(palm.phy,palm$traits[,4], clabel.l = 1,
##D  labels.n = palm.phy$Blabels, clabel.n = 0.75)
##D w <- cbind.data.frame(palm.phy$Bscores[,c(3,4,6,13,21)],
##D  scalewt((palm$traits[,4])))
##D names(w)[6] <- names(palm$traits[4])
##D table.phylog(w, palm.phy, clabel.r = 0.75, f = 0.5)
##D 
##D gearymoran(palm.phy$Amat, palm$traits[,-c(1,3)])
## End(Not run)


