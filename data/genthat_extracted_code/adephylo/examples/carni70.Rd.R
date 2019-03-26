library(adephylo)


### Name: carni70
### Title: Phylogeny and quantitative traits of carnivora
### Aliases: carni70
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D data(carni70)
##D rownames(carni70$tab) <- gsub("_", ".", rownames(carni70$tab))
##D tre <- read.tree(text=carni70$tre)
##D x <- phylo4d(tre, carni70$tab)
##D table.phylo4d(x)
##D 
##D par(mar=rep(.1,4))
##D table.phylo4d(x,cex.lab=.5, show.n=FALSE, ratio=.5)
##D 
##D 
##D ## transform size in log and test for a phylogenetic signal
##D size <- log(carni70$tab)[,1]
##D names(size) <- row.names(carni70$tab)
##D orthogram(size, tre)
##D 
##D ## transform range and test for a phylogenetic signal
##D yrange <- scale(carni70$tab)[,2]
##D names(yrange) <- row.names(carni70$tab)
##D orthogram(yrange, tre)
##D }
## End(Not run)




