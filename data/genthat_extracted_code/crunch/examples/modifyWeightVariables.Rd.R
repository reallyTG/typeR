library(crunch)


### Name: modifyWeightVariables
### Title: Change which variables can be set as a dataset's weight.
### Aliases: modifyWeightVariables is.weightVariable<- weightVariables<-
###   weightVariables<-,CrunchDataset-method is.weightVariable
###   is.weightVariable<-,NumericVariable-method

### ** Examples

## Not run: 
##D modifyweightVariables(ds, "weight", "append")
##D weightVariables(ds) <- list(ds$weight, ds$weight2)
##D weightVariables(ds) <- NULL
##D weightVariables(ds) <- c("weight", "weight2")
##D is.weightVariables(ds$weight) <- TRUE
## End(Not run)



