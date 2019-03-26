library(imptree)


### Name: node_imptree
### Title: Classification with Imprecise Probabilities
### Aliases: node_imptree print.node_imptree
### Keywords: tree

### ** Examples

data("carEvaluation")

## create a tree with IDM (s=1) to full size
## carEvaluation, leaving the first 10 observations out
ip <- imptree(acceptance~., data = carEvaluation[-(1:10),], 
  method="IDM", method.param = list(splitmetric = "globalmax", s = 1), 
  control = list(depth = NULL, minbucket = 1))

## obtain information on the root node
node_imptree(x = ip, idx = NULL)

## obtain information on the 2nd note in the 1st level
node_imptree(x = ip, idx = c(1, 2))

## reference to an invalid index and/or level generates error
## Not run: 
##D node_imptree(x = ip, idx = c(1,10))  # no 10th node on 1st level
## End(Not run)




