library(saemix)


### Name: plot,SaemixObject-method
### Title: General plot function from SAEM
### Aliases: plot,SaemixObject-method plot.saemix plot,SaemixObject plot
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

# Set of default plots
# plot(saemix.fit)

# Data
# plot(saemix.fit,plot.type="data")

# Convergence
# plot(saemix.fit,plot.type="convergence")

# Individual plot for subject 1, smoothed
# plot(saemix.fit,plot.type="individual.fit",ilist=1,smooth=TRUE)

# Individual plot for subject 1 to 12, with ask set to TRUE 
# (the system will pause before a new graph is produced)
# plot(saemix.fit,plot.type="individual.fit",ilist=c(1:12),ask=TRUE)

# Diagnostic plot: observations versus population predictions
# par(mfrow=c(1,1))
# plot(saemix.fit,plot.type="observations.vs.predictions",level=0,new=FALSE)

# LL by Importance Sampling
# plot(saemix.fit,plot.type="likelihood")

# Scatter plot of residuals
# Data will be simulated to compute weighted residuals and npde
# the results shall be silently added to the object saemix.fit
# plot(saemix.fit,plot.type="residuals.scatter")

# Boxplot of random effects
# plot(saemix.fit,plot.type="random.effects")

# Relationships between parameters and covariates
# plot(saemix.fit,plot.type="parameters.vs.covariates")

# Relationships between parameters and covariates, on the same page
# par(mfrow=c(3,2))
# plot(saemix.fit,plot.type="parameters.vs.covariates",new=FALSE)

# VPC
# Not run (time constraints for CRAN)
# plot(saemix.fit,plot.type="vpc")




