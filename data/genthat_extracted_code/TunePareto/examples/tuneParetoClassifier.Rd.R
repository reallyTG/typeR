library(TunePareto)


### Name: tuneParetoClassifier
### Title: Create a classifier object
### Aliases: tuneParetoClassifier
### Keywords: TuneParetoClassifier

### ** Examples

  # equivalent to tunePareto.svm()
  cl <- tuneParetoClassifier(name = "svm",
                             classifier = svm, 
                             predictor = predict, 
                             classifierParamNames = c("kernel", "degree", "gamma",
                                                      "coef0", "cost", "nu",
                                                      "class.weights", "cachesize", 
                                                      "tolerance", "epsilon",
                                                      "subset", "na.action"),
                              useFormula = FALSE,
                              trainDataName = "x",
                              trainLabelName = "y",
                              testDataName = "newdata",
                              modelName = "object",
                              requiredPackages="e1071")
  
  # call TunePareto with the classifier
  print(tunePareto(classifier = cl,
                   data = iris[, -ncol(iris)], 
                   labels = iris[, ncol(iris)],
                   cost = c(0.001,0.01,0.1,1,10), 
                   objectiveFunctions=
                     list(cvError(10, 10),
                          cvSpecificity(10, 10, 
                            caseClass="setosa"))))                           



