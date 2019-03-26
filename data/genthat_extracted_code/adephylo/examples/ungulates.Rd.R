library(adephylo)


### Name: ungulates
### Title: Phylogeny and quantitative traits of ungulates.
### Aliases: ungulates
### Keywords: datasets

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D ## load data
##D data(ungulates)
##D tre <- read.tree(text=ungulates$tre)
##D plot(tre)
##D 
##D ## look at two traits
##D afbw <- log(ungulates$tab[,1])
##D neonatw <- log((ungulates$tab[,2]+ungulates$tab[,3])/2)
##D names(afbw) <- tre$tip.label
##D names(neonatw) <- tre$tip.label
##D plot(afbw, neonatw) # relationship between traits
##D lm1 <- lm(neonatw~afbw)
##D abline(lm1)
##D x <- phylo4d(tre, cbind.data.frame(afbw, neonatw)) # traits on the phylogeny
##D 
##D ## test phylogenetic inertia in residuals
##D orthogram(residuals(lm1), x) 
##D }
## End(Not run)




