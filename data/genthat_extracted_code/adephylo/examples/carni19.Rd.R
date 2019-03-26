library(adephylo)


### Name: carni19
### Title: Phylogeny and quantative trait of carnivora
### Aliases: carni19
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D data(carni19)
##D tre <- read.tree(text=carni19$tre)
##D x <- phylo4d(tre, data.frame(carni19$bm))
##D table.phylo4d(x, ratio=.5, center=FALSE)
##D }
## End(Not run)




