library(ESKNN)


### Name: esknnProb
### Title: Train the ensemble of subset of k-nearest neighbours classifiers
###   for estimation of class membership probabilty.
### Aliases: esknnProb
### Keywords: esknnClass esknn

### ** Examples


# Load the data

  data(sonar)
  data <- sonar

# Divide the data into testing and training

  Class <- data[,names(data)=="Class"]
  data$Class<-as.factor(as.numeric(Class)-1)
  train <- data[sample(1:nrow(data),0.7*nrow(data)),]
  test <- data[-(sample(1:nrow(data),0.7*nrow(data))),]
  ytrain<-train[,names(train)=="Class"]
  xtrain<-train[,names(train)!="Class"]
  xtest<-test[,names(test)!="Class"]
  ytest <- test[,names(test)=="Class"]

# Trian esknnProb on training data

  model<-esknnProb(xtrain, ytrain,k=NULL)

# Predict on test data

  resProb<-Predict.esknnProb(model,xtest,ytest,k=NULL)

## Returning Objects

  resProb$PredProb
  resProb$BrierScore




