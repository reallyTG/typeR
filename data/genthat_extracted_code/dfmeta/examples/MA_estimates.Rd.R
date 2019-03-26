library(dfmeta)


### Name: MA_estimates
### Title: Executing the random effect model-based algorithm (REMB).
### Aliases: MA_estimates

### ** Examples

  ## Not run: 
##D     ################################################################
##D     ### Give a toxicity data for each simulation and each trial. ###
##D     ############ using "Toxdata"" including in package #############
##D     ################################################################
##D     
##D     data("Toxdata")
##D     dim(Toxdata)
##D     colnames(Toxdata)
##D     
##D     ## NOTE: The toxicity dataset must have the same structure as below. ##
##D     ## Check it before running the VarWT function! ##
##D     
##D     str(Toxdata)
##D     
##D     ## Running the MA_estimates function! ##
##D 
##D     test <- MA_estimates(Toxdata, 10, 10, family = binomial, link = "logit", nAGQ = 1, 
##D     			 control = glmerControl(optimizer = "bobyqa"))
##D     
##D     ### You can see the "show" S4 method to present the REMB algorithm's results
##D     test
##D 
##D     ##################################################
##D     ## Taking the predicted probability of toxicity ##
##D     ##################################################
##D     
##D     test@estimates
##D   
## End(Not run)



