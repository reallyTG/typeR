library(sensiPhy)


### Name: tree_influ_phyglm
### Title: Interaction between phylogenetic uncertainty and influential
###   species detection - Phylogenetic Logistic Regression
### Aliases: tree_influ_phyglm

### ** Examples

## Not run: 
##D # Simulate Data:
##D set.seed(6987)
##D mphy = rmtree(100, N = 30)
##D x = rTrait(n=1,phy=mphy[[1]])
##D X = cbind(rep(1,100),x)
##D y = rbinTrait(n=1,phy=mphy[[1]], beta=c(-1,0.5), alpha=.7 ,X=X)
##D dat = data.frame(y, x)
##D # Run sensitivity analysis:
##D tree_influ <- tree_influ_phyglm(y ~ x, data = dat, phy = mphy, n.tree = 5)
##D summary(tree_influ)
##D sensi_plot(tree_influ)
##D sensi_plot(tree_influ, graphs = 1)
##D sensi_plot(tree_influ, graphs = 2)
## End(Not run)



