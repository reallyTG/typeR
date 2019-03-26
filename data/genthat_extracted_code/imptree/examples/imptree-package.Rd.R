library(imptree)


### Name: imptree-package
### Title: imptree: Classification Trees with Imprecise Probabilities
### Aliases: imptree-package
### Keywords: tree

### ** Examples

data("carEvaluation")

## create a tree with IDM (s=1) to full size
## carEvaluation, leaving the first 10 observations out
ip <- imptree(acceptance~., data = carEvaluation[-(1:10),], 
  method="IDM", method.param = list(splitmetric = "globalmax", s = 1), 
  control = list(depth = NULL, minbucket = 1))

## summarize the tree and show performance on training data
summary(ip)

## predict the first 10 observations
## Note: The result of the prediction is return invisibly
pp <- predict(ip, dominance = "max", data = carEvaluation[(1:10),])
## print the general evaluation statistics
print(pp)
## display the predicted class labels
pp$classes




