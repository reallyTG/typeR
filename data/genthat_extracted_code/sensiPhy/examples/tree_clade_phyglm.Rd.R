library(sensiPhy)


### Name: tree_clade_phyglm
### Title: Interaction between phylogenetic uncertainty and influential
###   clade detection - Phylogenetic Logistic Regression
### Aliases: tree_clade_phyglm

### ** Examples

## Not run: 
##D # Simulate Data:
##D set.seed(6987)
##D mphy = rmtree(150, N = 30)
##D x = rTrait(n=1,phy=mphy[[1]])
##D X = cbind(rep(1,150),x)
##D y = rbinTrait(n=1,phy=mphy[[1]], beta=c(-1,0.5), alpha=.7 ,X=X)
##D cla <- rep(c("A","B","C","D","E"), each = 30)
##D dat = data.frame(y, x, cla)
##D # Run sensitivity analysis:
##D tree_clade <- tree_clade_phyglm(y ~ x, phy = mphy, data = dat, 
##D n.tree = 10, n.sim = 10, clade.col = "cla")
##D # To check summary results and most influential clades:
##D summary(tree_clade)
##D # Visual diagnostics for clade removal:
##D sensi_plot(tree_clade)
##D # Specify which clade removal to plot:
##D sensi_plot(tree_clade, "B")
##D sensi_plot(tree_clade, "C", graphs = 2)
##D sensi_plot(tree_clade, "D", graphs = 2) 
## End(Not run)
## Don't show: 
set.seed(6987)
mphy = rmtree(150, N = 30)
x = rTrait(n=1,phy=mphy[[1]])
X = cbind(rep(1,150),x)
y = rbinTrait(n=1,phy=mphy[[1]], beta=c(-1,0.5), alpha=.7 ,X=X)
cla <- rep(c("A","B","C","D","E"), each = 30)
dat = data.frame(y, x, cla)
# Run sensitivity analysis:
tree_clade <- tree_clade_phyglm(y ~ x, phy = mphy, data = dat, 
                               n.tree = 2, n.sim = 1, clade.col = "cla")
# To check summary results and most influential clades:
summary(tree_clade)
# Visual diagnostics for clade removal:
sensi_plot(tree_clade)
## End(Don't show)



