library(caret)


### Name: sbf
### Title: Selection By Filtering (SBF)
### Aliases: sbf sbf.default sbf.formula predict.sbf
### Keywords: models

### ** Examples


## Not run: 
##D data(BloodBrain)
##D 
##D ## Use a GAM is the filter, then fit a random forest model
##D RFwithGAM <- sbf(bbbDescr, logBBB,
##D                  sbfControl = sbfControl(functions = rfSBF,
##D                                          verbose = FALSE,
##D                                          method = "cv"))
##D RFwithGAM
##D 
##D predict(RFwithGAM, bbbDescr[1:10,])
##D 
##D ## classification example with parallel processing
##D 
##D ## library(doMC)
##D 
##D ## Note: if the underlying model also uses foreach, the
##D ## number of cores specified above will double (along with
##D ## the memory requirements)
##D ## registerDoMC(cores = 2)
##D 
##D data(mdrr)
##D mdrrDescr <- mdrrDescr[,-nearZeroVar(mdrrDescr)]
##D mdrrDescr <- mdrrDescr[, -findCorrelation(cor(mdrrDescr), .8)]
##D 
##D set.seed(1)
##D filteredNB <- sbf(mdrrDescr, mdrrClass,
##D                  sbfControl = sbfControl(functions = nbSBF,
##D                                          verbose = FALSE,
##D                                          method = "repeatedcv",
##D                                          repeats = 5))
##D confusionMatrix(filteredNB)
## End(Not run)





