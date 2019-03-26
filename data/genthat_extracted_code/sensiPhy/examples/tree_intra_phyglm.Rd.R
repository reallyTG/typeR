library(sensiPhy)


### Name: tree_intra_phyglm
### Title: Interaction between phylogenetic uncertainty and intraspecific
###   variability - Phylogenetic logistic Regression
### Aliases: tree_intra_phyglm

### ** Examples

# Simulate data
set.seed(6987)
mphy = ape::rmtree(150, N = 30)
x = phylolm::rTrait(n=1,phy=mphy[[1]])
x_sd = rnorm(150,mean = 0.8,sd=0.2)
X = cbind(rep(1,150),x)
y = rbinTrait(n=1,phy=mphy[[1]], beta=c(-1,0.5), alpha=.7 ,X=X)
dat = data.frame(y, x, x_sd)
intra.tree <- tree_intra_phyglm(y ~ x, data = dat, phy = mphy, n.intra = 3, 
                                           n.tree = 3, Vx = "x_sd")
# summary results:
summary(intra.tree)
# Visual diagnostics for phylogenetic uncertainty:
sensi_plot(intra.tree, uncer.type = "all") #or uncer.type = "tree", uncer.type = "intra"



