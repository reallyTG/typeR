library(rpst)


### Name: gen.data
### Title: Generate simulated data
### Aliases: gen.data

### ** Examples

#require(survival)
data <- gen.data(n = 20, p = 5, c = 2)
tree <- rpst(data$data, minsize = 2)
print.rpst(tree)



