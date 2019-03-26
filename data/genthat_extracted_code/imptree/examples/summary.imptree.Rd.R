library(imptree)


### Name: summary.imptree
### Title: Classification with Imprecise Probabilities
### Aliases: summary.imptree print.summary.imptree
### Keywords: tree

### ** Examples

data("carEvaluation")

## create a tree with IDM (s=1) to full size
## carEvaluation, leaving the first 10 observations out
ip <- imptree(acceptance~., data = carEvaluation[-(1:10),], 
  method="IDM", method.param = list(splitmetric = "globalmax", s = 1), 
  control = list(depth = NULL, minbucket = 1))

## summary including prediction on training data
summary(ip)                       # default prediction
summary(ip, dominance = "max")    # different prediction parameter




