library(dfmeta)


### Name: VarWT
### Title: The variance weighted (VarWT) pooling approach.
### Aliases: VarWT

### ** Examples

  ## Not run: 
##D     ## Using the toxicity dataset for each simulation and each trial, which is 
##D     ## existing in the dfmeta package.
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
##D     #################################
##D     ## Running the VarWT function! ##
##D     #################################
##D     
##D     WT <- VarWT(Toxdata)
##D     
##D     ######### If we want to save the result in a text file ###########
##D     ####### we need to give a name in the argument "saveName" ########
##D     
##D     WT <- VarWT(Toxdata, tempdir())
##D   
## End(Not run)



