library(adephylo)


### Name: moran.idx
### Title: Computes Moran's index for a variable
### Aliases: moran.idx
### Keywords: manip

### ** Examples


## Not run: 
##D ## use maples dataset
##D data(maples)
##D tre <- read.tree(text=maples$tre)
##D dom <- maples$tab$Dom
##D bif <- maples$tab$Bif
##D 
##D 
##D ## get a proximity matrix between tips 
##D W <- proxTips(tre, met="Abouheif")
##D 
##D ## compute Moran's I for two traits (dom and bif)
##D moran.idx(dom, W)
##D moran.idx(bif, W)
##D moran.idx(rnorm(nTips(tre)), W)
##D 
##D ## build a simple permutation test for 'bif'
##D sim <- replicate(499, moran.idx(sample(bif), W)) # permutations
##D sim <- c(moran.idx(bif, W), sim)
##D 
##D pval <- mean(sim>=sim[1]) # right-tail p-value
##D pval
##D 
##D hist(sim, col="grey", main="Moran's I Monte Carlo test for 'bif'") # plot
##D mtext("Histogram of permutations and observation (in red)")
##D abline(v=sim[1], col="red", lwd=3)
##D 
## End(Not run)



