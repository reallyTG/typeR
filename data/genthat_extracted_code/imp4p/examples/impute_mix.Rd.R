library(imp4p)


### Name: impute.mix
### Title: Imputation using a decision rule under an assumption of a
###   mixture of MCAR and MNAR values.
### Aliases: impute.mix
### Keywords: Imputation methods

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600);

#Fast imputation of missing values with the impute.rand algorithm
dat.rand=impute.rand(tab=res.sim$dat.obs,conditions=res.sim$condition);

#Estimation of the mixture model
res=estim.mix(tab=res.sim$dat.obs, tab.imp=dat.rand, conditions=res.sim$condition);

#Computing probabilities to be MCAR
born=estim.bound(tab=res.sim$dat.obs,conditions=res.sim$condition);
proba=prob.mcar.tab(born$tab.lower,born$tab.upper,res);

#Imputation under the assumption of MCAR and MNAR values
tabi=impute.mix(tab=res.sim$dat.obs, prob.MCAR=proba, conditions=res.sim$conditions,
repbio=res.sim$repbio, method="slsa", nknn=15, weight=1, selec="all", ind.comp=1,
progress.bar=TRUE);
## End(No test)



