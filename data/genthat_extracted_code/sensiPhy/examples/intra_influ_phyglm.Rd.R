library(sensiPhy)


### Name: intra_influ_phyglm
### Title: Interaction between intraspecific variability and influential
###   species - Phylogenetic Logistic Regression
### Aliases: intra_influ_phyglm

### ** Examples

## Not run: 
##D #Generate data
##D set.seed(6987)
##D phy = rtree(100)
##D x = rTrait(n=1,phy=phy,parameters=list(ancestral.state=2,optimal.value=2,sigma2=1,alpha=1))
##D X = cbind(rep(1,100),x)
##D y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
##D z = rnorm(n = length(x),mean = mean(x),sd = 0.1*mean(x))
##D dat = data.frame(y, x, z)
##D # Run sensitivity analysis:
##D intra_influ <- intra_influ_phyglm(formula = y ~ x, data = dat, phy = phy, 
##D                        Vx = "z", n.intra = 5,track = TRUE,distrib="normal",x.transf=NULL) 
##D # To check summary results and most influential species:
##D summary(intra_influ)
##D # Visual diagnostics for clade removal:
##D sensi_plot(intra_influ)
## End(Not run)
## Don't show: 
phy = rtree(100)
x = rTrait(n=1,phy=phy,parameters=list(ancestral.state=2,optimal.value=2,sigma2=1,alpha=1))
X = cbind(rep(1,100),x)
y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
z = rnorm(n = length(x),mean = mean(x),sd = 0.1*mean(x))
dat = data.frame(y, x, z)
# Run sensitivity analysis:
intra_influ <- intra_influ_phyglm(formula = y ~ x, data = dat[1:20,], phy = phy, 
                                 Vx = "z", n.intra = 2,track = TRUE,
                                 distrib="normal",x.transf=NULL) 
# To check summary results and most influential species:
summary(intra_influ)
# Visual diagnostics for clade removal:
sensi_plot(intra_influ)
## End(Don't show)



