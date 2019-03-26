library(caret)


### Name: preProcess
### Title: Pre-Processing of Predictors
### Aliases: preProcess preProcess.default predict.preProcess
### Keywords: utilities

### ** Examples


data(BloodBrain)
# one variable has one unique value
## Not run: 
##D preProc <- preProcess(bbbDescr)
##D 
##D preProc  <- preProcess(bbbDescr[1:100,-3])
##D training <- predict(preProc, bbbDescr[1:100,-3])
##D test     <- predict(preProc, bbbDescr[101:208,-3])
## End(Not run)




