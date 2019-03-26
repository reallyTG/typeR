library(imptree)


### Name: imptree
### Title: Classification Trees with Imprecise Probabilities
### Aliases: imptree imptree.formula imptree.default
### Keywords: tree

### ** Examples

data("carEvaluation")

## create a tree with IDM (s=1) to full size on
## carEvaluation, leaving the first 10 observations out
imptree(acceptance~., data = carEvaluation[-(1:10),], 
  method="IDM", method.param = list(splitmetric = "globalmax", s = 1), 
  control = list(depth = NULL, minbucket = 1)) # control args as list

## same setting as above, now passing control args in '...'
imptree(acceptance~., data = carEvaluation[-(1:10),], 
  method="IDM", method.param = list(splitmetric = "globalmax", s = 1), 
  depth = NULL, minbucket = 1)




