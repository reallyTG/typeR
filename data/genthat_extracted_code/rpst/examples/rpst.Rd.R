library(rpst)


### Name: rpst
### Title: Recursive Partitioning Survival Trees
### Aliases: rpst

### ** Examples

#require(survival)
data <- gen.data(n = 20, p = 5, c = 2)
tree <- rpst(data$data, minsize = 2)
print.rpst(tree)



