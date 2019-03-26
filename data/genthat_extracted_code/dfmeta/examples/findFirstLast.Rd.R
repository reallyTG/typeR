library(dfmeta)


### Name: findFirstLast
### Title: The first or the last occurence of a unique value.
### Aliases: findFirstLast

### ** Examples

  ################################################################
  ### Give a toxicity data for each simulation and each trial. ###
  ################################################################
  
  ### Using a toxicity data for each simulation and each trial including in the dfmeta package.
  
  data("Toxdata")
  dim(Toxdata)
  colnames(Toxdata)
  
  ## NOTE: The toxicity dataset must have the same structure as below. ##
  ## Check it before running the VarWT function! ##
  str(Toxdata)
  
  analyf0 <- Toxdata[order(Toxdata$simulation), ] # sort the imported data by simulation.
  
  ## Using the function findFirstLast to find when starts the first trial. ##
  first.trial = findFirstLast(analyf0)$Trial



