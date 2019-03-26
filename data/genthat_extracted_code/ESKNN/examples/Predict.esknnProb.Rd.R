library(ESKNN)


### Name: Predict.esknnProb
### Title: Prediction function returning class membership probability
###   estimates
### Aliases: Predict.esknnProb
### Keywords: Predict.esknnProb esknn

### ** Examples

# Load the data

data(sonar)
data <- sonar

# Divide the data into testing and training parts

  Class <- data[,names(data)=="Class"]
  
# Class Varible must be a factor in (0,1) 

  data$Class<-as.factor(as.numeric(Class)-1)
  train <- data[sample(1:nrow(data),0.7*nrow(data)),]
  test <- data[-(sample(1:nrow(data),0.7*nrow(data))),]
  ytrain<-train[,names(train)=="Class"]
  xtrain<-train[,names(train)!="Class"]
  xtest<-test[,names(test)!="Class"]
  ytest <- test[,names(test)=="Class"]

# Trian esknnProb

  model<-esknnProb(xtrain, ytrain,k=NULL)

# Predict on test data

  resProb<-Predict.esknnProb(model,xtest,ytest,k=NULL)

## Returning Objects

  resProb$PredProb
  resProb$BrierScore




