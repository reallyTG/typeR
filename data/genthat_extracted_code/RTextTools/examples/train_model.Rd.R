library(RTextTools)


### Name: train_model
### Title: makes a model object using the specified algorithm.
### Aliases: train_model
### Keywords: method

### ** Examples

library(RTextTools)
data(NYTimes)
data <- NYTimes[sample(1:3100,size=100,replace=FALSE),]
matrix <- create_matrix(cbind(data["Title"],data["Subject"]), language="english", 
removeNumbers=TRUE, stemWords=FALSE, weighting=tm::weightTfIdf)
container <- create_container(matrix,data$Topic.Code,trainSize=1:75, testSize=76:100, 
virgin=FALSE)
maxent_model <- train_model(container,"MAXENT")
svm_model <- train_model(container,"SVM")



