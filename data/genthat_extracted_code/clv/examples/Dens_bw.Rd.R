library(clv)


### Name: clv.Dens_bw
### Title: Inter-cluster density - Internal Measure
### Aliases: clv.DensBw
### Keywords: cluster

### ** Examples

# load and prepare data
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
agnes.mod <- agnes(iris.data) # create cluster tree 
v.pred <- as.integer(cutree(agnes.mod,5)) # "cut" the tree 

# compute Dens_bw index
scatt <- clv.Scatt(iris.data, v.pred)
dens.bw <- clv.DensBw(iris.data, v.pred, scatt)



