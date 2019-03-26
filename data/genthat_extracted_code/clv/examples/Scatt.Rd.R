library(clv)


### Name: clv.Scatt
### Title: Average scattering for clusters - Internal Measure
### Aliases: clv.Scatt
### Keywords: cluster

### ** Examples

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
agnes.mod <- agnes(iris.data) # create cluster tree 
v.pred <- as.integer(cutree(agnes.mod,5)) # "cut" the tree 

# compute Scatt index
scatt <- clv.Scatt(iris.data, v.pred)



