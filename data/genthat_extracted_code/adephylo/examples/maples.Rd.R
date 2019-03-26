library(adephylo)


### Name: maples
### Title: Phylogeny and quantitative traits of flowers
### Aliases: maples
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D data(maples)
##D 
##D ## see the tree
##D tre <- read.tree(text=maples$tre)
##D plot(tre)
##D axisPhylo()
##D 
##D ## look at two variables
##D dom <- maples$tab$Dom
##D bif <- maples$tab$Bif
##D plot(bif,dom,pch = 20)
##D abline(lm(dom~bif)) # a strong negative correlation ?
##D summary(lm(dom~bif))
##D cor.test(bif,dom)
##D 
##D ## look at the two variables onto the phylogeny
##D temp <- phylo4d(tre, data.frame(dom,bif, row.names=tre$tip.label))
##D table.phylo4d(temp) # correlation is strongly linked to phylogeny
##D 
##D ## use ape's PIC (phylogenetic independent contrasts)
##D pic.bif <- pic(bif, tre)
##D pic.dom <- pic(dom, tre)
##D cor.test(pic.bif, pic.dom) # correlation is no longer significant
##D }
## End(Not run)




