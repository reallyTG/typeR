library(isocir)


### Name: cond.test
### Title: Conditional Test for Contrasting Circular Order
### Aliases: cond.test
### Keywords: circular isotonic CIRE test

### ** Examples

data(cirdata)
# Example without replications and a partial circular order:
orderGroups <- c(1,1,1,2,2,3,4,4)
cond.test(cirdata, groups = orderGroups, kappa = 0.2)
# Example with replications and the next circular order:
orderGroups2 <- c(1:8)
data(datareplic)
cond.test(data = datareplic, groups = orderGroups2)



