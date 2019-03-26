library(CORElearn)


### Name: reliabilityPlot
### Title: Plots reliability plot of probabilities
### Aliases: reliabilityPlot
### Keywords: models classif

### ** Examples

# generate data consisting from 3 parts:
#  one part for training, one part for calibration, one part for testing
train <-classDataGen(noInst=200)
cal <-classDataGen(noInst=200)
test <- classDataGen(noInst=200)

# build random forests model with default parameters
modelRF <- CoreModel(class~., train, model="rf")
# prediction of calibration and test set
predCal <- predict(modelRF, cal, rfPredictClass=FALSE)
predTest <- predict(modelRF, test, rfPredictClass=FALSE)
destroyModels(modelRF) # no longer needed, clean up

# show reliability plot of uncalibrated test set
class1<-1
par(mfrow=c(1,2))
reliabilityPlot(predTest$prob[,class1], test$class, 
                titleText="Uncalibrated probabilities", classValue=class1) 

# calibrate for a chosen class1 and method using calibration set
calibration <- calibrate(cal$class, predCal$prob[,class1], class1=1, 
                         method="isoReg", assumeProbabilities=TRUE)
calTestProbs <- applyCalibration(predTest$prob[,class1], calibration)
# display calibrated probabilities
reliabilityPlot(calTestProbs, test$class, 
                titleText="Calibrated probabilities", classValue=class1) 




