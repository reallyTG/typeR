library(imp4p)


### Name: pi.mcar.karpievitch
### Title: Estimating the proportion of MCAR values in biological
###   conditions using the method of Karpievitch (2009).
### Aliases: pi.mcar.karpievitch
### Keywords: Missing value analysis

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600,pi.mcar=0.2,para=0.5,nb.cond=2,nb.repbio=3,
nb.sample=5,m.c=25,sd.c=2,sd.rb=0.5,sd.r=0.2);

#Deleting rows without any observed value in a condition
result=delete.na.rows(tab=res.sim$dat.obs, tab.c=res.sim$dat.comp, conditions=res.sim$conditions,
list.MCAR=res.sim$list.MCAR);

#Proportion of MCAR values in each condition
pi.mcar.karpievitch(tab=result$tab.mod,conditions=res.sim$conditions)
## End(No test)



