library(rpst)


### Name: rpst.km
### Title: Produces KM-curve plot of a "rpst" object
### Aliases: rpst.km

### ** Examples

#require(survival)
data <- gen.data(n = 20, p = 5, c = 2)
tree <- rpst(data$data, minsize = 2)
print.rpst(tree)

rpst.km(tree,data$data)

##not run##
#data <- gen.data(n = 100, p = 10, c = 2)
#tree <- rpst(data$data, minsize = 2)
#print.rpst(tree)

#rpst.km(tree,data$data)



