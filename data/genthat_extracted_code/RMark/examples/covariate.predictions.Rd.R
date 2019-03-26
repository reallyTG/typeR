library(RMark)


### Name: covariate.predictions
### Title: Compute estimates of real parameters for multiple covariate
###   values
### Aliases: covariate.predictions
### Keywords: utility

### ** Examples

pathtodata=paste(path.package("RMark"),"extdata",sep="/")
## No test: 
# This example is excluded from testing to reduce package check time
#
# indcov1.R
#
# CJS analysis of the individual covariate data from 12.2 of
# Cooch and White
#
# Import data (indcov1.inp) and convert it from the MARK inp file 
# format to the RMark format using the function convert.inp  
# It is defined with 1 group but 2 individual covariates of mass and 
# squared.mass
#
indcov1=convert.inp(paste(pathtodata,"indcov1",sep="/"),
               covariates=c("mass","squared.mass"))
#
# Next create the processed dataframe and the design data.
#
  ind1.process=process.data(indcov1,model="CJS")
  ind1.ddl=make.design.data(ind1.process)
#
# Next create the function that defines and runs the set of models
# and returns a marklist with the results and a model.table.  
# It does not have any arguments but does use the ind1.process 
# and ind1.ddl objects created above in the workspace. The function 
# create.model.list is the function that creates a dataframe of the
# names of the parameter specifications for each parameter in that 
# type of model. If none are given for any parameter, the default
# specification will be used for that parameter in mark.  The 
# first argument of mark.wrapper is the model list of parameter 
# specifications.  Remaining arguments that are passed to
# mark must be specified using the argument=value specification 
# because the arguments of mark were not repeated in mark.wrapper 
# so they must be passed using the argument=value syntax.
#
ind1.models=function()
{
  Phi.dot=list(formula=~1)
  Phi.mass=list(formula=~mass)
  Phi.mass.plus.mass.squared=list(formula=~mass + squared.mass)
  p.dot=list(formula=~1)
  cml=create.model.list("CJS")
  results=mark.wrapper(cml,data=ind1.process,ddl=ind1.ddl,adjust=FALSE)
  return(results)
}
#
# Next run the function to create the models and store the results in
# ind1.results which is a marklist. Note that beta estimates will differ
# from Cooch and White results because we are using covariate values 
# directly rather than standardized values.
#
ind1.results=ind1.models()
#
# Next compute real parameter values for survival as a function of 
# mass which are model-averaged over the fitted models.
#
minmass=min(indcov1$mass)
maxmass=max(indcov1$mass)
mass.values=minmass+(0:30)*(maxmass-minmass)/30
Phibymass=covariate.predictions(ind1.results,
   data=data.frame(mass=mass.values,squared.mass=mass.values^2),
    indices=c(1))
#
# Plot predicted model averaged estimates by weight with pointwise 
# confidence intervals
#
plot(Phibymass$estimates$mass, Phibymass$estimates$estimate,
   type="l",lwd=2,xlab="Mass(kg)",ylab="Survival",ylim=c(0,.65))
lines(Phibymass$estimates$mass, Phibymass$estimates$lcl,lty=2)
lines(Phibymass$estimates$mass, Phibymass$estimates$ucl,lty=2)

# indcov2.R
#
# CJS analysis of the individual covariate data from 12.3 of 
# Cooch and White
#
# Import data (indcov2.inp) and convert it from the MARK inp file 
# format to the RMark format using the function convert.inp  It is
# defined with 1 group but 2 individual covariates of mass and 
# squared.mass
#
indcov2=convert.inp(paste(pathtodata,"indcov2",sep="/"),
        covariates=c("mass","squared.mass"))
#
# Standardize covariates
#
actual.mass=indcov2$mass
standardize=function(x,z=NULL)
{
   if(is.null(z))
   {
       return((x-mean(x))/sqrt(var(x)))
   }else 
   {
      return((x-mean(z))/sqrt(var(z)))
   }
}
indcov2$mass=standardize(indcov2$mass)
indcov2$squared.mass=standardize(indcov2$squared.mass)
#
# Next create the processed dataframe and the design data.
#
  ind2.process=process.data(indcov2,model="CJS")
  ind2.ddl=make.design.data(ind2.process)
#
# Next create the function that defines and runs the set of models and 
# returns a marklist with the results and a model.table.  It does not
# have any arguments but does use the ind1.process and ind1.ddl 
# objects created above in the workspace. The function create.model.list 
# is the function that creates a dataframe of the names of the parameter
# specifications for each parameter in that type of model. If none are 
# given for any parameter, the default specification will be used for
# that parameter in mark.  The first argument of mark.wrapper is the
# model list of parameter specifications.  Remaining arguments that are
# passed to mark must be specified using the argument=value specification 
# because the arguments of mark were not repeated in mark.wrapper so 
# they must be passed using the argument=value syntax.
#
ind2.models=function()
{
  Phi.dot=list(formula=~1)
  Phi.time=list(formula=~time)
  Phi.mass=list(formula=~mass)
  Phi.mass.plus.mass.squared=list(formula=~mass + squared.mass)
  Phi.time.x.mass.plus.mass.squared=
        list(formula=~time:mass + time:squared.mass)
  Phi.time.mass.plus.mass.squared=
     list(formula=~time*mass + squared.mass+ time:squared.mass)
  p.dot=list(formula=~1)
  cml=create.model.list("CJS")
  results=mark.wrapper(cml,data=ind2.process,ddl=ind2.ddl,adjust=FALSE,threads=2)
  return(results)
}
#
# Next run the function to create the models and store the results in
# ind2.results which is a marklist. Note that beta estimates will differ
# because we are using covariate values directly rather than 
# standardized values.
#
ind2.results=ind2.models()
#
# Next compute real parameter values for survival as a function of 
# mass which are model-averaged over the fitted models. They are 
# standardized individually so the values have to be chosen differently.
#
minmass=min(actual.mass)
maxmass=max(actual.mass)
mass.values=minmass+(0:30)*(maxmass-minmass)/30
squared.mass.values=mass.values^2
mass.values=standardize(mass.values,actual.mass)
squared.mass.values=standardize(squared.mass.values,actual.mass^2)
Phibymass=covariate.predictions(ind2.results,
 data=data.frame(mass=mass.values,squared.mass=squared.mass.values),
  indices=c(1:7))
#
# Plot predicted model averaged estimates by weight with pointwise 
# confidence intervals
#
par(mfrow=c(4,2))
for (i in 1:7)
{
   mass=minmass+(0:30)*(maxmass-minmass)/30
   x=Phibymass$estimates
   plot(mass,x$estimate[x$par.index==i],type="l",lwd=2,
    xlab="Mass(kg)",ylab="Survival",ylim=c(0,1),main=paste("Time",i))
   lines(mass, x$lcl[x$par.index==i],lty=2)
   lines(mass, x$ucl[x$par.index==i],lty=2)
}
## End(No test)




