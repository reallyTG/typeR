library(Tlasso)


### Name: ChainOmega
### Title: Precision Matrix of Triangle Graph
### Aliases: ChainOmega

### ** Examples


m.vec = c(5,5,5)  # dimensionality of a tensor 
n = 5   # sample size 

Omega.true.list = list()

for ( k in 1:length(m.vec)){
 Omega.true.list[[k]] = ChainOmega(m.vec[k],sd=k*100,norm.type=2)
}
Omega.true.list  # a list of length 3 contains precision matrices from triangle graph




