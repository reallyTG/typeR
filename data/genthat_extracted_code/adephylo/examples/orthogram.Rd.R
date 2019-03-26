library(adephylo)


### Name: orthogram
### Title: Orthonormal decomposition of variance
### Aliases: orthogram

### ** Examples


## Not run: 
##D if(require(ape) && require(phylobase)){
##D 
##D ## a phylogenetic example
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
##D resid <- residuals(lm1)
##D abline(lm1)
##D 
##D ## plot the two traits and the residuals of lm1
##D x <- phylo4d(tre, cbind.data.frame(afbw, neonatw, residuals=resid))
##D table.phylo4d(x) # residuals are surely not independant
##D 
##D ## default orthogram for residuals of lm1
##D orthogram(resid, tre)
##D 
##D ## using another orthonormal basis (derived from Abouheif's proximity)
##D myOrthoBasis <- orthobasis.phylo(tre, method="oriAbouheif") # Abouheif's proximities
##D orthogram(resid, ortho=myOrthoBasis) # significant phylog. signal
##D 
##D ## Abouheif's test
##D W <- proxTips(tre, method="oriAbouheif") # proximity matrix
##D abouheif.moran(resid, W)
##D }
## End(Not run)




