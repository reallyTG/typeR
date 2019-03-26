library(sensiPhy)


### Name: intra_samp_phyglm
### Title: Interaction between intraspecific variability and species
###   sampling - Phylogenetic Logistic Regression
### Aliases: intra_samp_phyglm

### ** Examples

set.seed(6987)
phy = rtree(100)
x = rTrait(n=1,phy=phy,parameters=list(ancestral.state=2,optimal.value=2,sigma2=1,alpha=1))
X = cbind(rep(1,100),x)
y = rbinTrait(n=1,phy=phy, beta=c(-1,0.5), alpha=.7 ,X=X)
z = rnorm(n = length(x),mean = mean(x),sd = 0.1*mean(x))
dat = data.frame(y, x, z)
#Run sensitivity analysis:
intra_samp <- intra_samp_phyglm(formula = y ~ x, data = dat, phy = phy, 
                               n.sim=10, n.intra = 3,
                               breaks=seq(.1,.5,.1),
                               Vx = "z", distrib="normal", x.transf=NULL)
summary(intra_samp)
sensi_plot(intra_samp)



