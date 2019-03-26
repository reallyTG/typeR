library(LPStimeSeries)


### Name: predict.learnPattern
### Title: predict method for 'learnPattern' objects
### Aliases: predict.learnPattern
### Keywords: similarity

### ** Examples

data(GunPoint)
set.seed(71)
## Learn patterns on GunPoint training series with default parameters
ensemble=learnPattern(GunPoint$trainseries)

## Find representations
trainRep=predict(ensemble, GunPoint$trainseries, nodes=TRUE)
testRep=predict(ensemble, GunPoint$testseries, nodes=TRUE)

## Check size of the representation for training data
print(dim(trainRep))

## Learn patterns on GunPoint training series (target cannot be difference series)
ensemble=learnPattern(GunPoint$trainseries,target.diff=FALSE)

## Predict observations for test time series
predicted=predict(ensemble,GunPoint$testseries,nodes=FALSE)

## Plot an example test time series 
plot(GunPoint$testseries[5,],type='l',lty=1,xlab='Time',ylab='Observation',lwd=2)
points(c(1:ncol(GunPoint$testseries)),predicted$predictions[5,],type='l',col=2,lty=2,lwd=2)
legend('topleft',c('Original series','Approximation'),col=c(1,2),lty=c(1,2),lwd=2)




