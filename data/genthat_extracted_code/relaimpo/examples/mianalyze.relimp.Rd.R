library(relaimpo)


### Name: mianalyze.relimp
### Title: Function to do relative importance calculations based on
###   multiply imputed datasets
### Aliases: mianalyze.relimp
### Keywords: multivariate models htest

### ** Examples

  ## smi contains a list of 5 imputed datasets (class imputationList) from package mitools
  ## (first element of smi is list of data frames)
  ## it is not a well-suited example for relative importance but easily available for demonstrating 
  ##         multiple imputation-related functionality
  
  data(smi)
  
  ## obtain averaged estimates only, without confidence intervals
  ## works with factors and interactions
  mianalyze.relimp(smi[[1]], formula = cistot ~ drkfre+sex+wave, no.CI = TRUE)
  ## for obtaining all individual estimates, use lapply:
  smi.cr.list <- lapply(smi[[1]], function(obj) calc.relimp(cistot ~ drkfre+sex+wave, data=obj))
  ## display result for first individual imputed data set
  smi.cr.list[[1]]
  
  ## obtain confidence intervals, 
  ## currently only usable for models without calculated variables, factors, groups, interactions
  
  ## call without using weights, strata, clusters or a design list
  mianalyze.relimp(smi[[1]], formula = cistot ~ mdrkfre+sex+wave)  
  ## call using the id column (identical in all smi data sets) for cluster structure
  ident <- smi[[1]][[1]]$id
  mitest <- mianalyze.relimp(smi[[1]], formula = cistot ~ mdrkfre+sex+wave, ids=ident)  
  mitest
      ## postprocess: look at intervals with different confidence level
      summary(mitest,lev=0.8)
  ## call with design list
  deslist = lapply(smi[[1]], function(obj) svydesign(~id,strata=~sex,weights=~cistot,data=obj))
  mitest <- mianalyze.relimp(smi[[1]], formula = cistot ~ mdrkfre+sex+wave, deslist=deslist, 
       level=c(0.8))
  mitest  



