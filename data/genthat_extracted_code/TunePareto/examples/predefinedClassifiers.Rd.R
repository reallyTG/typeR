library(TunePareto)


### Name: predefinedClassifiers
### Title: TunePareto wrappers for certain classifiers
### Aliases: predefinedClassifiers tunePareto.knn tunePareto.svm
###   tunePareto.tree tunePareto.randomForest tunePareto.NaiveBayes
### Keywords: TuneParetoClassifier, knn svm tree randomForest NaiveBayes

### ** Examples

## No test: 
# tune a k-NN classifier with different 'k' and 'l' 
# on the 'iris' data set
print(tunePareto(classifier = tunePareto.knn(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 k = c(5,7,9),
                 l = c(1,2,3),
                 objectiveFunctions=list(cvError(10, 10),
                                         cvSpecificity(10, 10, caseClass="setosa"))))
                 
# tune an SVM with different costs on 
# the 'iris' data set
# using Halton sequences for sampling
print(tunePareto(classifier = tunePareto.svm(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 cost = as.interval(0.001,10),
                 sampleType = "halton",
                 numCombinations=20,                 
                 objectiveFunctions=list(cvWeightedError(10, 10),
                                         cvSensitivity(10, 10, caseClass="setosa"))))

# tune a CART classifier with different 
# splitting criteria on the 'iris' data set
print(tunePareto(classifier = tunePareto.tree(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 split = c("deviance","gini"),
                 objectiveFunctions=list(cvError(10, 10),
                                         cvErrorVariance(10, 10))))

# tune a Random Forest with different numbers of trees 
# on the 'iris' data set
print(tunePareto(classifier = tunePareto.randomForest(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 ntree = seq(50,300,50),
                 objectiveFunctions=list(cvError(10, 10),
                                         cvSpecificity(10, 10, caseClass="setosa"))))

# tune a Naive Bayes classifier with different kernels
# on the 'iris' data set
print(tunePareto(classifier = tunePareto.NaiveBayes(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 kernel = c("gaussian", "epanechnikov", "rectangular",
                            "triangular", "biweight",
                            "cosine", "optcosine"),
                 objectiveFunctions=list(cvError(10, 10),
                                         cvSpecificity(10, 10, caseClass="setosa"))))
                             
## End(No test)



