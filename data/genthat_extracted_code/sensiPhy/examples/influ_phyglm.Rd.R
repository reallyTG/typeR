library(sensiPhy)


### Name: influ_phyglm
### Title: Influential species detection - Phylogenetic Logistic Regression
### Aliases: influ_phyglm

### ** Examples

# Simulate Data:
set.seed(6987)
phy = rtree(100)
x = rTrait(n=1,phy=phy)
X = cbind(rep(1,100),x)
y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
dat = data.frame(y, x)
# Run sensitivity analysis:
influ <- influ_phyglm(y ~ x, data = dat, phy = phy) 
# To check summary results and most influential species:
summary(influ)
# Visual diagnostics for clade removal:
sensi_plot(influ)



