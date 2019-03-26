library(ecospat)


### Name: ecospat.CCV.createDataSplitTable
### Title: Creates a DataSplitTable for usage in ecospat.ccv.modeling.
### Aliases: ecospat.CCV.createDataSplitTable
### Keywords: ~kwd1 ~kwd2

### ** Examples

## Not run: 
##D #Creating a DataSplitTable for 200 sites, 25 runs with an 
##D #80/20 calibration/evaluation cross-validation
##D 
##D DataSplitTable <- ecospat.CCV.createDataSplitTable(NbSites = 200, 
##D                                                    NbRunEval=25, 
##D                                                    DataSplit=80, 
##D                                                    validation.method='cross-validation')
##D                                                    
##D #Loading species occurence data and remove empty communities
##D testData <- ecospat.testData[,c(24,34,43,45,48,53,55:58,60:63,65:66,68:71)]
##D sp.data <- testData[which(rowSums(testData)>0), sort(colnames(testData))]
##D 
##D #Creating a DataSplitTable based on species data directly
##D DataSplitTable <- ecospat.CCV.createDataSplitTable(NbRunEval = 20,
##D                                                    DataSplit = 70,
##D                                                    validation.method = "cross-validation",
##D                                                    NbSites = NULL,
##D                                                    sp.data = sp.data, 
##D                                                    minNbPresence = 15, 
##D                                                    minNbAbsences = 15, 
##D                                                    maxNbTry = 250)
## End(Not run)




