library(rpst)


### Name: print.rpst
### Title: Print out a "rpst" object
### Aliases: print.rpst

### ** Examples

#require(survival)
data <- gen.data(n = 20, p = 5, c = 2)
tree <- rpst(data$data, minsize = 2)
print.rpst(tree)



