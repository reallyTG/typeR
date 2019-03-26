library(mlrCPO)


### Name: %>>%
### Title: CPO Composition / Attachment / Application Operator
### Aliases: %>>% %<<% %<>>% %<<<% %>|% %|<%

### ** Examples

# PCA-rotate pid.task
rotated.pid.task = pid.task %>>% cpoScale() %>>% cpoPca()

# Centering / Scaling *after* PCA
newPCA = cpoPca() %>>% cpoScale()

# Attach the above to learner
pcaLogreg = newPCA %>>% makeLearner("classif.logreg")

# append cpoAsNumeric to newPCA
newPCA %<>>% cpoAsNumeric()
print(newPCA)

# prepend cpoAsNumeric to pcaLogreg
pcaLogreg %<<<% cpoAsNumeric()




