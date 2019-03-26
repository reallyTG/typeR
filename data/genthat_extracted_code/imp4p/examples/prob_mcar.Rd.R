library(imp4p)


### Name: prob.mcar
### Title: Estimation of a vector of probabilities that missing values are
###   MCAR.
### Aliases: prob.mcar
### Keywords: Missing value analysis

### ** Examples

## No test: 
#Simulating data
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600,pi.mcar=0.2,para=10,nb.cond=2,nb.repbio=3,
nb.sample=5,m.c=25,sd.c=2,sd.rb=0.5,sd.r=0.2);

#Imputation of missing values with the slsa algorithm
dat.slsa=impute.slsa(tab=res.sim$dat.obs,conditions=res.sim$condition,repbio=res.sim$repbio);

#Estimation of the mixture model
res=estim.mix(tab=res.sim$dat.obs, tab.imp=dat.slsa, conditions=res.sim$condition);

#Computing probabilities to be MCAR
born=estim.bound(tab=res.sim$dat.obs,conditions=res.sim$condition);

#Computing probabilities to be MCAR in the first column of result$tab.mod
proba=prob.mcar(b.l=born$tab.lower[,1],b.u=born$tab.upper[,1],absc=res$abs.mod,
pi.mcar=res$pi.mcar[1], F.tot=res$F.tot[,1], F.na=res$F.na[,1]);
## End(No test)



