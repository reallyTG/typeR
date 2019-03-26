library(imptree)


### Name: predict.imptree
### Title: Classification with Imprecise Probabilities
### Aliases: predict.imptree print.evaluation_imptree
### Keywords: tree

### ** Examples

data("carEvaluation")

## create a tree with IDM (s=1) to full size
## carEvaluation, leaving the first 10 observations out
ip <- imptree(acceptance~., data = carEvaluation[-(1:10),], 
  method="IDM", method.param = list(splitmetric = "globalmax", s = 1), 
  control = list(depth = NULL, minbucket = 1))

## predict the first 10 observations with 'max' dominance
pp <- predict(ip, dominance = "max", data = carEvaluation[(1:10),])
print(pp)
pp$classes                ## predicted classes as logical matrix

## predict the first 10 observations with 'strong' dominance and
## use a different level of utility
predict(ip, dominance = "strong", data = carEvaluation[(1:10),],
        utility = 0.5)




