library(adephylo)


### Name: tithonia
### Title: Phylogeny and quantitative traits of flowers
### Aliases: tithonia
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D data(tithonia)
##D tre <- read.tree(text=tithonia$tre)
##D traits <- log(tithonia$tab + 1)
##D rownames(traits) <- gsub("_", ".", rownames(traits))
##D 
##D ## build a phylo4d object
##D x <- phylo4d(tre, traits)
##D par(mar=rep(.1,4))
##D table.phylo4d(x)
##D 
##D }
## End(Not run)




