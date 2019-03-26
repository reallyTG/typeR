library(sensiPhy)


### Name: samp_phyglm
### Title: Sensitivity Analysis Species Sampling - Phylogenetic Logistic
###   Regression
### Aliases: samp_phyglm

### ** Examples

# Simulate Data:
set.seed(6987)
phy = rtree(100)
x = rTrait(n=1,phy=phy)
X = cbind(rep(1,100),x)
y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
dat = data.frame(y, x)
# Run sensitivity analysis:
samp <- samp_phyglm(y ~ x, data = dat, phy = phy, n.sim = 10) 
# To check summary results and most influential species:
summary(samp)
## Not run: 
##D # Visual diagnostics for clade removal:
##D sensi_plot(samp)
## End(Not run)



