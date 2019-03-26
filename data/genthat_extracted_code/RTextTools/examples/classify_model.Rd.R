library(RTextTools)


### Name: classify_model
### Title: makes predictions from a train_model() object.
### Aliases: classify_model
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
maxent_results <- classify_model(container,maxent_model)



