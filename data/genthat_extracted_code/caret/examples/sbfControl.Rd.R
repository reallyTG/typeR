library(caret)


### Name: sbfControl
### Title: Control Object for Selection By Filtering (SBF)
### Aliases: sbfControl
### Keywords: utilities

### ** Examples


## Not run: 
##D data(BloodBrain)
##D 
##D ## Use a GAM is the filter, then fit a random forest model
##D set.seed(1)
##D RFwithGAM <- sbf(bbbDescr, logBBB,
##D                  sbfControl = sbfControl(functions = rfSBF,
##D                                          verbose = FALSE,
##D                                          seeds = sample.int(100000, 11),
##D                                          method = "cv"))
##D RFwithGAM
##D 
##D 
##D ## A simple example for multivariate scoring
##D rfSBF2 <- rfSBF
##D rfSBF2$score <- function(x, y) apply(x, 2, rfSBF$score, y = y)
##D 
##D set.seed(1)
##D RFwithGAM2 <- sbf(bbbDescr, logBBB,
##D                   sbfControl = sbfControl(functions = rfSBF2,
##D                                           verbose = FALSE,
##D                                           seeds = sample.int(100000, 11),
##D                                           method = "cv",
##D                                           multivariate = TRUE))
##D RFwithGAM2
##D 
##D 
## End(Not run)



