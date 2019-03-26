library(CORElearn)


### Name: calibrate
### Title: Calibration of probabilities according to the given prior.
### Aliases: calibrate applyCalibration
### Keywords: models classif

### ** Examples

# generate data set separately for training the model, 
#   calibration of probabilities and testing
train <-classDataGen(noInst=200)
cal <-classDataGen(noInst=200)
test <- classDataGen(noInst=200)

# build random forests model with default parameters
modelRF <- CoreModel(class~., train, model="rf", maxThreads=1)

# prediction 
predCal <- predict(modelRF, cal, rfPredictClass=FALSE)
predTest <- predict(modelRF, test, rfPredictClass=FALSE)
destroyModels(modelRF) # clean up, model not needed anymore

# calibrate for a chosen class1 and method
class1<-1
calibration <- calibrate(cal$class, predCal$prob[,class1], class1=class1, 
                         method="isoReg",assumeProbabilities=TRUE)

# apply the calibration to the testing set
calibratedProbs <- applyCalibration(predTest$prob[,class1], calibration)
# the calibration of probabilities can be visualized with 
# reliabilityPlot function




