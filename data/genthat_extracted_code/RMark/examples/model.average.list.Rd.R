library(RMark)


### Name: model.average.list
### Title: Compute model averaged estimates of real parameters from a list
###   structure for estimates
### Aliases: model.average.list
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# Create a set of models from dipper data
data(dipper)
run.dipper=function()
{
dipper$nsex=as.numeric(dipper$sex)-1
mod1=mark(dipper,groups="sex",
   model.parameters=list(Phi=list(formula=~sex)))
mod2=mark(dipper,groups="sex",
   model.parameters=list(Phi=list(formula=~1)))
mod3=mark(dipper,groups="sex",
   model.parameters=list(p=list(formula=~time),
   Phi=list(formula=~1)))
dipper.list=collect.models()
return(dipper.list)
}
dipper.results=run.dipper()
# Extract indices for first year survival from 
#  Females (group 1) and Males (group 2)
Phi.indices=extract.indices(dipper.results[[1]],
   "Phi",df=data.frame(group=c(1,2),row=c(1,1),col=c(1,1)))
# Create a matrix for estimates
estimate=matrix(0,ncol=length(Phi.indices),
    nrow=nrow(dipper.results$model.table))
# Extract weights for models
weight=dipper.results$model.table$weight
# Create an empty list for vcv matrices
vcv=vector("list",length=nrow(dipper.results$model.table))
# Loop over each model in model.table for dipper.results
for (i in 1:nrow(dipper.results$model.table))
{
# The actual model number is the row number for the model.table
  model.numbers= as.numeric(row.names(dipper.results$model.table))
# For each model extract those real parameter values and their
# vcv matrix and store them
  x=covariate.predictions(dipper.results[[model.numbers[i]]],
      data=data.frame(index=Phi.indices))
  estimate[i,]=x$estimates$estimate
  vcv[[i]]=x$vcv
}
# Call model.average using the list structure which includes 
#  estimate, weight and vcv list in this case
model.average(list(estimate=estimate,weight=weight,vcv=vcv))
#
# Now get same model averaged estimates using model.average.marklist
# Obviously this is a much easier approach and what would be used 
# if all you are doing is model averaging real parameters in the model.  
# The other form is more useful for model averaging
# functions of estimates of the real parameters (eg population estimate)
#
mavg=model.average(dipper.results,"Phi",vcv=TRUE)
print(mavg$estimates[Phi.indices,])
print(mavg$vcv.real[Phi.indices,Phi.indices])
## End(No test)




