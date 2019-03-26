library(ade4)


### Name: carni70
### Title: Phylogeny and quantitative traits of carnivora
### Aliases: carni70
### Keywords: datasets

### ** Examples

## Not run: 
##D if (requireNamespace("adephylo", quietly = TRUE) & requireNamespace("ape", quietly = TRUE)) {
##D   data(carni70)
##D   carni70.phy <- newick2phylog(carni70$tre)
##D   plot(carni70.phy)
##D   
##D   size <- scalewt(log(carni70$tab))[,1]
##D   names(size) <- row.names(carni70$tab)
##D   symbols.phylog(carni70.phy,size)
##D   
##D   tre <- ape::read.tree(text = carni70$tre)
##D   adephylo::orthogram(size, tre = tre)
##D   
##D   yrange <- scalewt(carni70$tab[,2])
##D   names(yrange) <- row.names(carni70$tab)
##D   symbols.phylog(carni70.phy,yrange)
##D   adephylo::orthogram(as.vector(yrange), tre = tre)
##D   
##D   if(adegraphicsLoaded()) {
##D     g1 <- s.label(cbind.data.frame(size, yrange), plabel.cex = 0)
##D     g2 <- addhist(g1)
##D   } else {
##D     s.hist(cbind.data.frame(size, yrange), clabel = 0)
##D   }
##D }
## End(Not run)


