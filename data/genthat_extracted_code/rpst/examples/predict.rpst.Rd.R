library(rpst)


### Name: predict.rpst
### Title: Make predictions from a "rpst" object
### Aliases: predict.rpst

### ** Examples

#require(survival)
##not run##
#data <- gen.data(n = 100, p = 10, c = 2)
#tree <- rpst(data$data, minsize = 2)
#class = predict.rpst(tree,data$data)$class

data <- gen.data(n = 20, p = 5, c = 2)
tree <- rpst(data$data, minsize = 2)
class = predict.rpst(tree,data$data)$class



