library(adephylo)


### Name: procella
### Title: Phylogeny and quantitative traits of birds
### Aliases: procella
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D ## load data, make tree and phylo4d object
##D data(procella)
##D tre <- read.tree(text=procella$tre)
##D x <- phylo4d(tre, procella$traits)
##D par(mar=rep(.1,4))
##D table.phylo4d(x,cex.lab=.7)
##D }
## End(Not run)




