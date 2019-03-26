library(sensiPhy)


### Name: tree_phyglm
### Title: Phylogenetic uncertainty - Phylogenetic Logistic Regression
### Aliases: tree_phyglm

### ** Examples

### Simulating Data:
set.seed(6987)
mphy = rmtree(150, N = 30)
x = rTrait(n=1,phy=mphy[[1]])
X = cbind(rep(1,150),x)
y = rbinTrait(n=1,phy=mphy[[1]], beta=c(-1,0.5), alpha=.7 ,X=X)
dat = data.frame(y, x)
# Run sensitivity analysis:
tree <- tree_phyglm(y ~ x, data = dat, phy = mphy, n.tree = 30)
# summary results:
summary(tree)
# Visual diagnostics for phylogenetic uncertainty:
sensi_plot(tree)



