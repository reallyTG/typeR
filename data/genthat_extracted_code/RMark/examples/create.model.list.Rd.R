library(RMark)


### Name: create.model.list
### Title: Creates a dataframe of all combinations of parameter
###   specifications
### Aliases: create.model.list
### Keywords: utility

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
#
# Compare this to the run.dipper shown under ?dipper
# It is only necessary to create each parameter specification and 
# create.model.list and mark.wrapper will create and run models for 
# each combination. Notice that the naming of the parameter 
# specifications has been changed to accommodate format for 
# create.model.list. Only a subset of the parameter specifications 
# are used here in comparison to other run.dipper
#
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
     dipper.ddl$Phi$Flood[dipper.ddl$Phi$time==2 |
                  dipper.ddl$Phi$time==3]=1
     dipper.ddl$p$Flood=0
     dipper.ddl$p$Flood[dipper.ddl$p$time==3]=1
     #
     #  Define range of models for Phi
     #
     Phi.dot=list(formula=~1)
     Phi.time=list(formula=~time)
     Phi.sex=list(formula=~sex)
     Phi.Flood=list(formula=~Flood)
     #
     #  Define range of models for p
     #
     p.dot=list(formula=~1)
     p.time=list(formula=~time)
     p.Flood=list(formula=~Flood)
     #
     # Run all pairings of models
     #
     dipper.model.list=create.model.list("CJS")
     dipper.results=mark.wrapper(dipper.model.list,
              data=dipper.processed,ddl=dipper.ddl)
     #
     # Return model table and list of models
     #
     return(dipper.results)
}
dipper.results=run.dipper()
## End(No test)



