library(RMark)


### Name: model.average.marklist
### Title: Compute model averaged estimates of real parameters
### Aliases: model.average.marklist
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
data(dipper)
run.dipper=function()
{
#
# Process data
#
dipper.processed=process.data(dipper,groups=("sex"))
#
# Create default design data
#
dipper.ddl=make.design.data(dipper.processed)
#
# Add Flood covariates for Phi and p that have different values
#
dipper.ddl$Phi$Flood=0
dipper.ddl$Phi$Flood[dipper.ddl$Phi$time==2 | dipper.ddl$Phi$time==3]=1
dipper.ddl$p$Flood=0
dipper.ddl$p$Flood[dipper.ddl$p$time==3]=1
#
#  Define range of models for Phi
#
Phi.dot=list(formula=~1)
Phi.time=list(formula=~time)
Phi.sex=list(formula=~sex)
Phi.sextime=list(formula=~sex+time)
Phi.sex.time=list(formula=~sex*time)
Phi.Flood=list(formula=~Flood)
#
#  Define range of models for p
#
p.dot=list(formula=~1)
p.time=list(formula=~time)
p.sex=list(formula=~sex)
p.sextime=list(formula=~sex+time)
p.sex.time=list(formula=~sex*time)
p.Flood=list(formula=~Flood)
#
# Collect pairings of models
#
cml=create.model.list("CJS")
#
# Run and return the list of models
#
return(mark.wrapper(cml,data=dipper.processed,ddl=dipper.ddl))
}
dipper.results=run.dipper()
Phi.estimates=model.average(dipper.results,"Phi",vcv=TRUE)
p.estimates=model.average(dipper.results,"p",vcv=TRUE)
run.dipper=function()
{
data(dipper)
dipper$nsex=as.numeric(dipper$sex)-1
#NOTE:  This generates random valules for the weights so the answers using
#  ~weight will vary
dipper$weight=rnorm(294)  
mod1=mark(dipper,groups="sex",
  model.parameters=list(Phi=list(formula=~sex+weight)))
mod2=mark(dipper,groups="sex",
  model.parameters=list(Phi=list(formula=~sex)))
mod3=mark(dipper,groups="sex",
  model.parameters=list(Phi=list(formula=~weight)))
mod4=mark(dipper,groups="sex",
  model.parameters=list(Phi=list(formula=~1)))
dipper.list=collect.models()
return(dipper.list)
}
dipper.results=run.dipper()
real.averages=model.average(dipper.results,vcv=TRUE)
# get model averaged estimates for all parameters and use average 
# covariate values in models with covariates
real.averages$estimates 
# get model averaged estimates for Phi using a value of 2 for weight
model.average(dipper.results,"Phi", 
  data=data.frame(weight=2),vcv=FALSE)  
# what you can't do yet is use different covariate values for 
# different groups to get covariances of estimates based on different
# covariate values; for example, you can get average survival of females 
# at average female weight and average survival of males at average 
# male weight in separate calls to model.average but not in the same call 
# to get covariances; however, if you standardized weight by group 
# (ie stdwt = weight - groupmean) then using 0 for the covariate value would give
# the model averaged Phi by group at the average group weights and its 
# covariance. You can do the above for
# a single model with find.covariates/fill.covariates.
# get model averaged estimates of first Phi(1) and first p(43) and v-c matrix
model.average(dipper.results,vcv=TRUE,indices=c(1,43))  
## End(No test)




