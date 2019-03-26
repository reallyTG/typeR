library(simone)


### Name: getNetwork
### Title: Network extraction from a SIMoNe run
### Aliases: getNetwork
### Keywords: graphs

### ** Examples

## load the breast cancer data set
data(cancer)
attach(cancer)

## launch SIMoNe on the full data set
res <- simone(expr)

## the default selected network (at most p edges)
plot(getNetwork(res))

## a sub network on some 10 randomly selected genes
plot(getNetwork(res,"BIC", nodes = sample(colnames(expr),10)))

## a network with a penalty corresponding to at most 40 edges
plot(getNetwork(res, 40))

detach(cancer)



