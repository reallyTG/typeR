library(dfmeta)


### Name: doseRecords
### Title: Random Effect Analysis
### Aliases: doseRecords

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
  
  analyf0 <- Toxdata[order(Toxdata$simulation), ]


  ####################################################
  ## Taking the records from random effect analysis ##
  ####################################################
  rec <- doseRecords(analyf0)



