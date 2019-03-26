library(Tlasso)


### Name: NeighborOmega
### Title: Precision Matrix of Nearest-Neighbor Graph
### Aliases: NeighborOmega

### ** Examples


m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 
knn=4 # sparsity 

Omega.true.list = list()

for ( k in 1:length(m.vec)){
  Omega.true.list[[k]] = NeighborOmega(m.vec[k],knn=4, sd=k*100,norm.type=2)
}
Omega.true.list  # a list of length 3 contains precision matrices from 4-nearnest neighbor graph




