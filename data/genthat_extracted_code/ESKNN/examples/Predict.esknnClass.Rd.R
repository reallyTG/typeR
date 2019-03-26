library(ESKNN)


### Name: Predict.esknnClass
### Title: Class predictions from ensemble of subset of k-nearest
###   neighbours
### Aliases: Predict.esknnClass
### Keywords: packages

### ** Examples

# Load the data

  data(hepatitis)
  data <- hepatitis

# Spliting the data into testing and training parts.

  Class <- data[,names(data)=="Class"]
  data$Class<-as.factor(as.numeric(Class)-1)
  train <- data[sample(1:nrow(data),0.7*nrow(data)),]
  test <- data[-(sample(1:nrow(data),0.7*nrow(data))),]
  ytrain<-train[,names(train)=="Class"]
  xtrain<-train[,names(train)!="Class"]
  xtest<-test[,names(test)!="Class"]
  ytest <- test[,names(test)=="Class"]
  
# Trian esknnClass using training data

model<-esknnClass(xtrain, ytrain,k=NULL)

# Predict on test data

resClass<-Predict.esknnClass(model,xtest,ytest,k=NULL)

# Returning Objects are predicted class labels, confusion matrix and classification error

  resClass$predClass
  resClass$ConfMatrix             
  resClass$ClassError 




