library(TunePareto)


### Name: generateCVRuns
### Title: Generate cross-validation partitions
### Aliases: generateCVRuns
### Keywords: cross-validation

### ** Examples


# precalculate the cross-validation partitions
foldList <- generateCVRuns(labels = iris[, ncol(iris)],
                           ntimes = 10,
                           nfold = 10,
                           stratified=TRUE)

 # build a list of objective functions
objectiveFunctions <- list(cvError(foldList=foldList),
                           cvSensitivity(foldList=foldList,caseClass="setosa"))

# pass them to tunePareto
print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.knn(),
                 k = c(3,5,7,9),
                 objectiveFunctions = objectiveFunctions))



