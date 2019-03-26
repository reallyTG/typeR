library(sensiPhy)


### Name: intra_clade_phyglm
### Title: Interaction between intraspecific variability and influential
###   clade detection - Phylogenetic Logistic Regression
### Aliases: intra_clade_phyglm

### ** Examples

## Not run: 
##D set.seed(6987)
##D phy = rtree(100)
##D x = rTrait(n=1,phy=phy,parameters=list(ancestral.state=2,optimal.value=2,sigma2=1,alpha=1))
##D X = cbind(rep(1,100),x)
##D y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
##D z = rnorm(n = length(x),mean = mean(x),sd = 0.1*mean(x))
##D cla <- rep(c("A","B","C","D"), each = 25)
##D dat = data.frame(y, x, z, cla)
##D intra_clade <- intra_clade_phyglm(formula=y ~ x, data = dat, phy = phy,
##D                                   clade.col = "cla", n.sim = 30, n.intra = 3,
##D                                   x.transf = log, Vx = "z", distrib="normal")
##D sensi_plot(intra_clade)
##D sensi_plot(intra_clade, clade = "B", graphs = 2)
## End(Not run)
## Don't show: 
set.seed(6987)
phy = rtree(100)
x = rTrait(n=1,phy=phy,parameters=list(ancestral.state=2,optimal.value=2,sigma2=1,alpha=1))
X = cbind(rep(1,100),x)
y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
z = rnorm(n = length(x),mean = mean(x),sd = 0.1*mean(x))
cla <- rep(c("A","B","C","D"), each = 25)
dat = data.frame(y, x, z, cla)
intra_clade <- intra_clade_phyglm(formula=y ~ x, data = dat, phy = phy,
                                 clade.col = "cla", n.sim = 1, n.intra = 1,
                                 x.transf = log, Vx = "z", distrib="normal")
sensi_plot(intra_clade)
## End(Don't show)



