library(OTE)


### Name: Predict.OTProb
### Title: Prediction function for the object returned by 'OTProb'
### Aliases: Predict.OTProb
### Keywords: Predict.OTProb OptTreesEns

### ** Examples

#load the data

  data(Body)
  data <- Body
  
#Divide the data into training and test parts

  set.seed(9123) 
  n <- nrow(data)
  training <- sample(1:n,round(2*n/3))
  testing <- (1:n)[-training]
  X <- data[,1:24]
  Y <- data[,25]
  
#Train OTClass on the training data

  Opt.Trees <- OTProb(XTraining=X[training,],YTraining = Y[training],t.initial=200)
  
#Predict on test data

  Prediction <- Predict.OTProb(Opt.Trees, X[testing,],YTesting=Y[testing])
  
#Objects returned

  names(Prediction)
  Prediction$Brier.Score
  Prediction$Estimated.Probabilities

  


