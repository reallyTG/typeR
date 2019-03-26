library(CORElearn)


### Name: attrEval
### Title: Attribute evaluation
### Aliases: attrEval
### Keywords: regression nonlinear classif

### ** Examples

# use iris data

# run method ReliefF with exponential rank distance  
estReliefF <- attrEval(Species ~ ., iris, 
                       estimator="ReliefFexpRank", ReliefIterations=30)
print(estReliefF)

# alternatively and more appropriate for large data sets 
# one can specify just the target variable
# estReliefF <- attrEval("Species", iris, estimator="ReliefFexpRank",
#                        ReliefIterations=30)

# print all available estimators
infoCore(what="attrEval")



