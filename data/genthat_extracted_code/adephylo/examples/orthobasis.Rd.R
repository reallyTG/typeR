library(adephylo)


### Name: orthobasis.phylo
### Title: Computes Moran's eigenvectors from a tree or a phylogenetic
###   proximity matrix
### Aliases: orthobasis.phylo me.phylo
### Keywords: manip

### ** Examples


if(require(ape) && require(phylobase)){

## SIMPLE EXAMPLE ##
## make a tree
x <- rtree(50)

## compute Moran's eigenvectors
ME <- me.phylo(x, met="Abouheif")
ME

## plot the 10 first vectors
obj <- phylo4d(x, as.data.frame(ME[,1:10]))
table.phylo4d(obj, cex.sym=.7, cex.lab=.7)


## Not run: 
##D ## REMOVING PHYLOGENETIC AUTOCORRELATION IN A MODEL ##
##D ## use example in ungulates dataset
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
##D 
##D lm1
##D resid1 <- residuals(lm1)
##D orthogram(resid1, tre) # residuals are autocorrelated
##D 
##D ## compute Moran's eigenvectors (ME)
##D myME <- me.phylo(tre, method="Abou")
##D lm2 <- lm(neonatw ~ myME[,1] + afbw) # use for ME as covariable
##D resid2 <- residuals(lm2)
##D orthogram(resid2, tre) # there is no longer phylogenetic autocorrelation
##D 
##D ## see the difference
##D table.phylo4d(phylo4d(tre, cbind.data.frame(resid1, resid2)))
## End(Not run)
}




