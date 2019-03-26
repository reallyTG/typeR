library(RTextTools)


### Name: create_ensembleSummary
### Title: creates a summary with ensemble coverage and precision.
### Aliases: create_ensembleSummary
### Keywords: method

### ** Examples

library(RTextTools)
data(NYTimes)
data <- NYTimes[sample(1:3100,size=100,replace=FALSE),]
matrix <- create_matrix(cbind(data["Title"],data["Subject"]), language="english", 
removeNumbers=TRUE, stemWords=FALSE, weighting=tm::weightTfIdf)
container <- create_container(matrix,data$Topic.Code,trainSize=1:75, testSize=76:100, 
virgin=FALSE)
models <- train_models(container, algorithms=c("MAXENT","SVM"))
results <- classify_models(container, models)
analytics <- create_analytics(container, results)

ensemble <- create_ensembleSummary(analytics@document_summary)
ensemble



