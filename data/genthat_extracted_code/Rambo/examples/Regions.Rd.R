library(Rambo)


### Name: Regions
### Title: A simulated network with subgraphs and typed edges
### Aliases: Regions
### Keywords: rsm subgraph Regions

### ** Examples

data(Regions)
res <- rsm(Regions$X, Regions$sub, Klist=2:4, nbredo=1, maxit=5) 
plot(res)



