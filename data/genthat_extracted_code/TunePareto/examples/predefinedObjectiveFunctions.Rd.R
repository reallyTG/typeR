library(TunePareto)


### Name: predefinedObjectiveFunctions
### Title: Predefined objective functions for parameter tuning
### Aliases: predefinedObjectiveFunctions reclassAccuracy reclassError
###   reclassWeightedError reclassSensitivity reclassRecall
###   reclassTruePositive reclassSpecificity reclassTrueNegative
###   reclassFallout reclassFalsePositive reclassMiss reclassFalseNegative
###   reclassPrecision reclassPPV reclassNPV reclassConfusion cvAccuracy
###   cvError cvErrorVariance cvWeightedError cvSensitivity cvRecall
###   cvTruePositive cvSpecificity cvTrueNegative cvFallout cvFalsePositive
###   cvMiss cvFalseNegative cvPrecision cvPPV cvNPV cvConfusion
### Keywords: objective function multi-objective optimization MOO

### ** Examples


# build a list of objective functions
objectiveFunctions <- list(cvError(10, 10),
                           reclassSpecificity(caseClass="setosa"), 
                           reclassSensitivity(caseClass="setosa"))

# pass them to tunePareto
print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.knn(),
                 k = c(3,5,7,9),
                 objectiveFunctions = objectiveFunctions))



