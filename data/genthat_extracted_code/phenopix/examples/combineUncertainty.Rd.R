library(phenopix)


### Name: combineUncertainty
### Title: An evolution of 'greenProcess' for the combination of
###   uncertainty after processing
### Aliases: combineUncertainty

### ** Examples

## Not run: 
##D   require(zoo) 
##D   data(bartlett2009.filtered)
##D   combined.fit <- combineUncertainty(na.approx(bartlett2009.filtered), nrep=100)
##D # 100 replications for each fitting
##D   names(combined.fit) # a dataframe for each phenoMethod + a list with all fittings
##D   fit.summary <- summarizePhases(combined.fit, across.methods=TRUE)
##D ## again a list with one element for each fitting method + two additional items 
##D ## if across.methods is TRUE, which combines gu + klosterman phenophase methods 
##D ## in a single method, and the same happens for trs and derivatives
##D   plotSum(bartlett2009.filtered, fit.summary, which='klosterman')
##D ## a plot with original timeseries + phenophases and their uncertainty
##D   
## End(Not run)
  


