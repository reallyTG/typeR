library(rpst)


### Name: plot.rpst
### Title: Produces a tree plot of a "rpst" object
### Aliases: plot.rpst

### ** Examples

#require(survival)
data <- gen.data(n = 20, p = 5, c = 2)
tree <- rpst(data$data, minsize = 2)
print.rpst(tree)

plot.rpst(tree)



