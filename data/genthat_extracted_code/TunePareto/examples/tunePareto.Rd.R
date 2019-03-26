library(TunePareto)


### Name: tunePareto
### Title: Generic function for multi-objective parameter tuning of
###   classifiers
### Aliases: tunePareto
### Keywords: parameter tuning multi-objective optimization MOO parallel
###   multi-core

### ** Examples

## No test: 

# tune 'k' of a k-NN classifier 
# on two classes of the 'iris' data set --
# see ?knn
print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.knn(), 
                 k = c(1,3,5,7,9),
                 objectiveFunctions = list(cvError(10, 10),
                                           reclassError())))
                 
# example using predefined parameter configurations,
# as certain combinations of k and l are invalid:
comb <- c(allCombinations(list(k=1,l=0)),
          allCombinations(list(k=3,l=0:2)),
          allCombinations(list(k=5,l=0:4)),
          allCombinations(list(k=7,l=0:6)))

print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.knn(), 
                 parameterCombinations = comb,
                 objectiveFunctions = list(cvError(10, 10),
                                           reclassError())))
                                           

# tune 'cost' and 'kernel' of an SVM on
# the 'iris' data set using Latin Hypercube sampling --
# see ?svm and ?predict.svm
print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.svm(), 
                 cost = as.interval(0.001,10), 
                 kernel = c("linear", "polynomial",
                          "radial", "sigmoid"),
                 sampleType="latin",
                 numCombinations=20,                          
                 objectiveFunctions = list(cvError(10, 10),
                                           cvSensitivity(10, 10, caseClass="setosa"))))

# tune the same parameters using Evolution Strategies
## No test: 
print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.svm(), 
                 cost = as.interval(0.001,10), 
                 kernel = c("linear", "polynomial",
                          "radial", "sigmoid"),
                 sampleType="evolution",
                 numCombinations=20,
                 numIterations=20,                      
                 objectiveFunctions = list(cvError(10, 10),
                                           cvSensitivity(10, 10, caseClass="setosa"),
                                           cvSpecificity(10, 10, caseClass="setosa"))))
## End(No test)
## End(No test)



