library(phylometrics)


### Name: treestat
### Title: Significance test of user defined phylogenetic metric
### Aliases: treestat

### ** Examples

phy <- treesim(pars=c(0.1,0.1,0.05,0.05,0.1,0.1),N0=50,N1=50,sampling.f=c(1,1),max.t=Inf)
treestat(phy, func=tars, traitevol="random", a=1000, alternative="two.sided", simplify=TRUE)



