library(adephylo)


### Name: mjrochet
### Title: Phylogeny and quantitative traits of teleos fishes
### Aliases: mjrochet
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D data(mjrochet)
##D tre <- read.tree(text=mjrochet$tre) # make a tree
##D traits <- log((mjrochet$tab))
##D 
##D ## build a phylo4d
##D mjr <- phylo4d(tre, traits)
##D 
##D ## see data
##D table.phylo4d(mjr,cex.lab=.5,show.node=FALSE,symb="square")
##D 
##D ## perform Abouheif's test for each trait
##D mjr.tests <- abouheif.moran(mjr, nrep=499)
##D mjr.tests
##D 
##D }
## End(Not run)




