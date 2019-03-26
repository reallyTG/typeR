library(flars)


### Name: predict.flars
### Title: Prediction for functional least angle regression.
### Aliases: predict.flars

### ** Examples

library(flars)
library(fda)
## Generate some data.
dataL=data_generation(seed = 1,uncorr = TRUE,nVar = 8,nsamples = 120,
      var_type = 'm',cor_type = 3)

## Split the training data and the testing data
nTrain=80
nsamples=120

TrainIdx=seq(nTrain)
TestIdx=seq(nsamples)[-TrainIdx]
fsmTrain=lapply(dataL$x,function(fsmI) fsmI[TrainIdx,,drop=FALSE])
fsmTest=lapply(dataL$x,function(fsmI) fsmI[TestIdx,,drop=FALSE])
yTrain=dataL$y[TrainIdx]
yTest=dataL$y[TestIdx]
  
## Do the variable selection
out=flars(fsmTrain,yTrain,method='basis',max_selection=9,
    normalize='norm',lasso=FALSE)
	
## Do the prediction
pred=predict(out,newdata = fsmTest)

# apply(pred,2,flars:::rmse,yTest)



