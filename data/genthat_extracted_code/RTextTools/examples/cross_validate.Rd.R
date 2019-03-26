library(RTextTools)


### Name: cross_validate
### Title: used for cross-validation of various algorithms.
### Aliases: cross_validate
### Keywords: method

### ** Examples

library(RTextTools)
data(NYTimes)
data <- NYTimes[sample(1:3100,size=100,replace=FALSE),]
matrix <- create_matrix(cbind(data["Title"],data["Subject"]), language="english", 
removeNumbers=TRUE, stemWords=FALSE, weighting=tm::weightTfIdf)
container <- create_container(matrix,data$Topic.Code,trainSize=1:75, testSize=76:100, 
virgin=FALSE)
svm <- cross_validate(container,2,algorithm="SVM")
maxent <- cross_validate(container,2,algorithm="MAXENT")



