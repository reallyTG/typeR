library(sensiPhy)


### Name: tree_samp_phyglm
### Title: Interaction between phylogenetic uncertainty and sensitivity to
###   species sampling - Phylogenetic Logistic Regression
### Aliases: tree_samp_phyglm

### ** Examples

# Simulate Data:
set.seed(6987)
mphy = rmtree(100, N = 30)
x = rTrait(n=1,phy=mphy[[1]])
X = cbind(rep(1,100),x)
y = rbinTrait(n=1,phy=mphy[[1]], beta=c(-1,0.5), alpha=.7 ,X=X)
dat = data.frame(y, x)
# Run sensitivity analysis:
tree_samp <- tree_samp_phyglm(y ~ x, data = dat, phy = mphy, n.tree = 3, n.sim=10) 
summary(tree_samp)
sensi_plot(tree_samp)
sensi_plot(tree_samp, graphs = 1)
sensi_plot(tree_samp, graphs = 2)



