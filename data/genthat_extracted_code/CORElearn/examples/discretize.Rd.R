library(CORElearn)


### Name: discretize
### Title: Discretization of numeric attributes
### Aliases: discretize applyDiscretization intervalMidPoint
### Keywords: regression nonlinear classif

### ** Examples

# use iris data
# run method using estimator ReliefF with exponential rank distance  
discBounds <- discretize(Species ~ ., iris, method="greedy", 
                         estimator="ReliefFexpRank")
print(discBounds)
discreteIris <- applyDiscretization(iris, discBounds)
prototypePoints <- intervalMidPoint(iris, discBounds, 
                                    midPointMethod="equalFrequency")

regData <- regDataGen(200)
discretize(response ~ ., regData, method="greedy", estimator="RReliefFequalK", 
           maxBins=2)
 
# print all available estimators
#infoCore(what="attrEval")
#infoCore(what="attrEvalReg")





