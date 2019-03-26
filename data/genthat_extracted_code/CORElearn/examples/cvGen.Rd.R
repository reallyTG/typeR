library(CORElearn)


### Name: cvGen
### Title: Cross-validation and stratified cross-validation
### Aliases: cvGen cvGenStratified gatherFromList

### ** Examples

data <- iris
folds <- 10
foldIdx <- cvGen(nrow(data), k=folds)
evalCore<-list()
for (j in 1:folds) {
	dTrain <- data[foldIdx!=j,]
	dTest  <- data[foldIdx==j,]
	modelCore <- CoreModel(Species~., dTrain, model="rf") 
	predCore <- predict(modelCore, dTest)
	evalCore[[j]] <- modelEval(modelCore, correctClass=dTest$Species,
	          predictedClass=predCore$class, predictedProb=predCore$prob ) 
	destroyModels(modelCore)
}
results <- gatherFromList(evalCore)
sapply(results, mean)



