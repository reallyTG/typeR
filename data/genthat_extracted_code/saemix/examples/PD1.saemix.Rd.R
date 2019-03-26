library(saemix)


### Name: PD1.saemix
### Title: Data simulated according to an Emax response model, in SAEM
###   format
### Aliases: PD1.saemix PD2.saemix
### Keywords: datasets

### ** Examples
 

data(PD1.saemix)
saemix.data<-saemixData(name.data=PD1.saemix,header=TRUE,name.group=c("subject"),
  name.predictors=c("dose"),name.response=c("response"),
  name.covariates=c("gender"), units=list(x="mg",y="-",covariates=c("-")))

modelemax<-function(psi,id,xidep) {
# input:
#   psi : matrix of parameters (3 columns, E0, Emax, EC50)
#   id : vector of indices 
#   xidep : dependent variables (same nb of rows as length of id)
# returns:
#   a vector of predictions of length equal to length of id
  dose<-xidep[,1]
  e0<-psi[id,1]
  emax<-psi[id,2]
  e50<-psi[id,3]
  f<-e0+emax*dose/(e50+dose)
  return(f)
}

# Plotting the data
plot(saemix.data,main="Simulated data PD1")

# Not run (strict time constraints for CRAN)

# Compare models with and without covariates with LL by Importance Sampling
# SE not computed
model1<-saemixModel(model=modelemax,description="Emax growth model", 
  psi0=matrix(c(20,300,20,0,0,0),ncol=3,byrow=TRUE,dimnames=list(NULL,
  c("E0","Emax","EC50"))), transform.par=c(1,1,1),
  covariate.model=matrix(c(0,0,0), ncol=3,byrow=TRUE),fixed.estim=c(1,1,1))

model2<-saemixModel(model=modelemax,description="Emax growth model", 
  psi0=matrix(c(20,300,20,0,0,0),ncol=3,byrow=TRUE,dimnames=list(NULL, 
  c("E0","Emax","EC50"))), transform.par=c(1,1,1),
  covariate.model=matrix(c(0,0,1), ncol=3,byrow=TRUE),fixed.estim=c(1,1,1))

saemix.options<-list(algorithms=c(0,1,1),nb.chains=3,seed=765754, 
  nbiter.saemix=c(500,300),save=FALSE,save.graphs=FALSE)

# Not run (strict time constraints for CRAN)
# fit1<-saemix(model1,saemix.data,saemix.options)
# fit2<-saemix(model2,saemix.data,saemix.options)
# wstat<-(-2)*(fit1["results"]["ll.is"]-fit2["results"]["ll.is"])

# cat("LRT test for covariate effect on EC50: p-value=",1-pchisq(wstat,1),"\n")



