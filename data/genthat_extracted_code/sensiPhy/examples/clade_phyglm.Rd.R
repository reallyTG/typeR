library(sensiPhy)


### Name: clade_phyglm
### Title: Estimate the impact on model estimates of phylogenetic logistic
###   regression after removing clades from the analysis.
### Aliases: clade_phyglm

### ** Examples

## Not run: 
##D # Simulate Data:
##D set.seed(6987)
##D phy = rtree(150)
##D x = rTrait(n=1,phy=phy)
##D X = cbind(rep(1,150),x)
##D y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
##D cla <- rep(c("A","B","C","D","E"), each = 30)
##D dat = data.frame(y, x, cla)
##D # Run sensitivity analysis:
##D clade <- clade_phyglm(y ~ x, phy = phy, data = dat, n.sim = 30, clade.col = "cla")
##D # To check summary results and most influential clades:
##D summary(clade)
##D # Visual diagnostics for clade removal:
##D sensi_plot(clade)
##D # Specify which clade removal to plot:
##D sensi_plot(clade, "B")
##D sensi_plot(clade, "C")
##D sensi_plot(clade, "D") #The clade with the largest effect on slope and intercept
## End(Not run)



