library(ESKNN)


### Name: esknnClass
### Title: Train ensemble of subset of k-nearest neighbours classifiers for
###   classification
### Aliases: esknnClass
### Keywords: esknnClass esknn

### ** Examples

# Load the data

  data(hepatitis)
  data <- hepatitis

# Divide the data into testing and training parts

  Class <- data[,names(data)=="Class"]
  data$Class<-as.factor(as.numeric(Class)-1)
  train <- data[sample(1:nrow(data),0.7*nrow(data)),]
  test <- data[-(sample(1:nrow(data),0.7*nrow(data))),]
  ytrain<-train[,names(train)=="Class"]
  xtrain<-train[,names(train)!="Class"]
  xtest<-test[,names(test)!="Class"]
  ytest <- test[,names(test)=="Class"]
  
# Trian esknnClass

  model<-esknnClass(xtrain, ytrain,k=NULL)

# Predict on test data

  resClass<-Predict.esknnClass(model,xtest,ytest,k=NULL)
  
# Returning Objects are predicted class labels, confusion matrix and classification error

  resClass$PredClass
  resClass$ConfMatrix             
  resClass$ClassError 
 



