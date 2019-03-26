library(imp4p)


### Name: miss.mnar.process
### Title: Estimating the MNAR mechanism in a sample.
### Aliases: miss.mnar.process
### Keywords: Missing value analysis

### ** Examples

## No test: 
#Simulating data
res.sim=sim.data(nb.pept=2000,nb.miss=600,pi.mcar=0.2,para=0.5,nb.cond=2,nb.repbio=3,
nb.sample=5,m.c=25,sd.c=2,sd.rb=0.5,sd.r=0.2);

#Imputation of missing values with the slsa algorithm
dat.slsa=impute.slsa(tab=res.sim$dat.obs,conditions=res.sim$condition,repbio=res.sim$repbio);

#Estimation of the mixture model
res=estim.mix(tab=res.sim$dat.obs, tab.imp=dat.slsa, conditions=res.sim$condition);

#Estimating the MNAR mechanism in the first replicate
mnp=miss.mnar.process(res$abs.mod,res$pi.mcar[1],res$F.mnar[,1],res$F.na[,1])
plot(mnp$abs,mnp$p,ty="l",xlab="Intensity values",ylab="Estimated probability to be MNAR")
## End(No test)



