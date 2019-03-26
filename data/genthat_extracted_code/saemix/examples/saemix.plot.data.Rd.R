library(saemix)


### Name: saemix.plot.data
### Title: Functions implementing each type of plot in SAEM
### Aliases: saemix.plot.data saemix.plot.convergence saemix.plot.llis
###   saemix.plot.obsvspred saemix.plot.distribresiduals
###   saemix.plot.scatterresiduals saemix.plot.fits saemix.plot.distpsi
###   saemix.plot.randeff saemix.plot.correlations saemix.plot.parcov
###   saemix.plot.randeffcov saemix.plot.npde saemix.plot.vpc
###   saemix.plot.parcov.aux compute.sres compute.eta.map
### Keywords: plot

### ** Examples


data(theo.saemix)

saemix.data<-saemixData(name.data=theo.saemix,header=TRUE,sep=" ",na=NA, 
  name.group=c("Id"),name.predictors=c("Dose","Time"),
  name.response=c("Concentration"),name.covariates=c("Weight","Sex"),
  units=list(x="hr",y="mg/L",covariates=c("kg","-")), name.X="Time")

model1cpt<-function(psi,id,xidep) { 
	  dose<-xidep[,1]
	  tim<-xidep[,2]  
	  ka<-psi[id,1]
	  V<-psi[id,2]
	  CL<-psi[id,3]
	  k<-CL/V
	  ypred<-dose*ka/(V*(ka-k))*(exp(-k*tim)-exp(-ka*tim))
	  return(ypred)
}

saemix.model<-saemixModel(model=model1cpt,
  description="One-compartment model with first-order absorption", 
  psi0=matrix(c(1.,20,0.5,0.1,0,-0.01),ncol=3, byrow=TRUE,
  dimnames=list(NULL, c("ka","V","CL"))),transform.par=c(1,1,1),
  covariate.model=matrix(c(0,1,0,0,0,0),ncol=3,byrow=TRUE),fixed.estim=c(1,1,1),
  covariance.model=matrix(c(1,0,0,0,1,0,0,0,1),ncol=3,byrow=TRUE),
  omega.init=matrix(c(1,0,0,0,1,0,0,0,1),ncol=3,byrow=TRUE),error.model="constant")

saemix.options<-list(seed=632545,save=FALSE,save.graphs=FALSE)

# Not run (strict time constraints for CRAN)
# saemix.fit<-saemix(saemix.model,saemix.data,saemix.options)

# Simulate data and compute weighted residuals and npde
# saemix.fit<-compute.sres(saemix.fit)

# Data
# saemix.plot.data(saemix.fit)

# Convergence
# saemix.plot.convergence(saemix.fit)

# Individual plot for subject 1, smoothed
# saemix.plot.fits(saemix.fit,ilist=1,smooth=TRUE)

# Individual plot for subject 1 to 12, with ask set to TRUE 
# (the system will pause before a new graph is produced)
# saemix.plot.fits(saemix.fit,ilist=c(1:12),ask=TRUE)

# Diagnostic plot: observations versus population predictions
# par(mfrow=c(1,1))
# saemix.plot.obsvspred(saemix.fit,level=0,new=FALSE)

# LL by Importance Sampling
# saemix.plot.llis(saemix.fit)

# Scatter plot of residuals
# saemix.plot.scatterresiduals(saemix.fit)

# Boxplot of random effects
# saemix.plot.randeff(saemix.fit)

# Relationships between parameters and covariates
# saemix.plot.parcov(saemix.fit)

# Relationships between parameters and covariates, on the same page
# par(mfrow=c(3,2))
# saemix.plot.parcov(saemix.fit,new=FALSE)

# VPC, default options (10 bins, equal number of observations in each bin)
# Not run (time constraints for CRAN)
# saemix.plot.vpc(saemix.fit)

# VPC, user-defined breaks for binning
# Not run (time constraints for CRAN)
# saemix.plot.vpc(saemix.fit,vpc.method="user", vpc.breaks=c(0.4,0.8,1.5,2.5,4,5.5,8,10,13))




