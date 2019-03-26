library(saemix)


### Name: yield.saemix
### Title: Wheat yield in crops treated with fertiliser, in SAEM format
### Aliases: yield.saemix
### Keywords: datasets

### ** Examples


data(yield.saemix)
saemix.data<-saemixData(name.data=yield.saemix,header=TRUE,name.group=c("site"),
  name.predictors=c("dose"),name.response=c("yield"),
  name.covariates=c("soil.nitrogen"),units=list(x="kg/ha",y="t/ha",
  covariates=c("kg/ha")))

# Model: linear + plateau
yield.LP<-function(psi,id,xidep) {
# input:
#   psi : matrix of parameters (3 columns, ymax, xmax, slope)
#   id : vector of indices 
#   xidep : dependent variables (same nb of rows as length of id)
# returns:
#   a vector of predictions of length equal to length of id
  x<-xidep[,1]
  ymax<-psi[id,1]
  xmax<-psi[id,2]
  slope<-psi[id,3]
  f<-ymax+slope*(x-xmax)
#  cat(length(f),"  ",length(ymax),"\n")
  f[x>xmax]<-ymax[x>xmax]
  return(f)
}
saemix.model<-saemixModel(model=yield.LP,description="Linear plus plateau model",   
  psi0=matrix(c(8,100,0.2,0,0,0),ncol=3,byrow=TRUE,dimnames=list(NULL,   
  c("Ymax","Xmax","slope"))),covariate.model=matrix(c(0,0,0),ncol=3,byrow=TRUE), 
  transform.par=c(0,0,0),covariance.model=matrix(c(1,0,0,0,1,0,0,0,1),ncol=3, 
  byrow=TRUE),error.model="constant")

saemix.options<-list(algorithms=c(1,1,1),nb.chains=1,seed=666, 
   save=FALSE,save.graphs=FALSE)

# Plotting the data
plot(saemix.data,xlab="Fertiliser dose (kg/ha)", ylab="Wheat yield (t/ha)")

# Not run (strict time constraints for CRAN)
# saemix.fit<-saemix(saemix.model,saemix.data,saemix.options)

# Comparing the likelihoods obtained by linearisation and importance sampling 
# to the likelihood obtained by Gaussian Quadrature
# Not run
# saemix.fit<-llgq.saemix(saemix.fit)
{
# cat("LL by Importance sampling, LL_IS=",saemix.fit["results"]["ll.is"],"\n")
# cat("LL by linearisation, LL_lin=",saemix.fit["results"]["ll.lin"],"\n")
# cat("LL by Gaussian Quadrature, LL_GQ=",saemix.fit["results"]["ll.gq"],"\n")
}

# Testing for an effect of covariate soil.nitrogen on Xmax
saemix.model2<-saemixModel(model=yield.LP,description="Linear plus plateau model", 
  psi0=matrix(c(8,100,0.2,0,0,0),ncol=3,byrow=TRUE,dimnames=list(NULL, 
  c("Ymax","Xmax","slope"))),covariate.model=matrix(c(0,1,0),ncol=3,byrow=TRUE), 
  transform.par=c(0,0,0),covariance.model=matrix(c(1,0,0,0,1,0,0,0,1),ncol=3, 
  byrow=TRUE),error.model="constant")

# saemix.fit2<-saemix(saemix.model2,saemix.data,saemix.options)
# BIC for the two models
{
#  cat("Model without covariate, BIC=",saemix.fit["results"]["bic.is"],"\n")
#  cat("Model with covariate, BIC=",saemix.fit2["results"]["bic.is"],"\n")
#  pval<-1-pchisq(-2*saemix.fit["results"]["ll.is"]+2*saemix.fit2["results"]["ll.is"],1)
#  cat("        LRT: p=",pval,"\n")
}



