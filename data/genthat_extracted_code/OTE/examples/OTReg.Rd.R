library(OTE)


### Name: OTReg
### Title: Train the ensemble of optimal trees for regression.
### Aliases: OTReg
### Keywords: OTReg OptTreesEns

### ** Examples

# Load the data

  data(Galaxy)
  data <- Galaxy
  
#Divide the data into training and test parts

  set.seed(9123) 
  n <- nrow(data)
  training <- sample(1:n,round(2*n/3))
  testing <- (1:n)[-training]
  X <- data[,1:4]
  Y <- data[,5]
  
#Train OTReg on the training data

  Opt.Trees <- OTReg(XTraining=X[training,],YTraining = Y[training],t.initial=200)
  
#Predict on test data

  Prediction <- Predict.OTReg(Opt.Trees, X[testing,],YTesting=Y[testing])
  
#Objects returned

  names(Prediction)
  Prediction$Unexp.Variations
  Prediction$Pr.Values
  Prediction$Trees.Used



