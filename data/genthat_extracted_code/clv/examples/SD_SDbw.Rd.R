library(clv)


### Name: clv.SD, clv.SDbw
### Title: SD, SDbw - Internal Measures
### Aliases: clv.SD clv.SDbw
### Keywords: cluster

### ** Examples

# load and prepare
library(clv)
data(iris)
iris.data <- iris[,1:4]

# cluster data
agnes.mod <- agnes(iris.data) # create cluster tree 
v.pred <- as.integer(cutree(agnes.mod,5)) # "cut" the tree 

# prepare proper input data for SD and S_Dbw indicies
scatt <- clv.Scatt(iris.data, v.pred)
dis <- clv.Dis(scatt$cluster.center)
dens.bw <- clv.DensBw(iris.data, v.pred, scatt)

# compute  SD and S_Dbw indicies
SD <- clv.SD(scatt$Scatt, dis, alfa=5) # alfa is equal to number of clusters 
SDbw <- clv.SDbw(scatt$Scatt, dens.bw)



