library(adephylo)


### Name: palm
### Title: Phylogenetic and quantitative traits of amazonian palm trees
### Aliases: palm
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D ## load data, make a tree and a phylo4d object
##D data(palm)
##D tre <- read.tree(text=palm$tre)
##D rord <- as.integer(palm$traits$rord) # just use this for plotting purpose
##D traits <- data.frame(rord, palm$traits[,-1])
##D x <- phylo4d(tre, traits)
##D 
##D ## plot data
##D par(mar=rep(.1,4))
##D table.phylo4d(x, cex.lab=.6)
##D 
##D ## test phylogenetic autocorrelation
##D if(require(ade4)){
##D prox <- proxTips(x, method="sumDD")
##D phylAutoTests <- gearymoran(prox, traits[,-3], nrep=499)
##D plot(phylAutoTests)
##D }
##D }
## End(Not run)




