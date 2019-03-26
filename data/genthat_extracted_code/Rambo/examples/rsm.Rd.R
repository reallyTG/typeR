library(Rambo)


### Name: rsm
### Title: The Random Subgraph Model
### Aliases: rsm
### Keywords: subgraph rsm

### ** Examples

data(Regions)
res <- rsm(Regions$X, Regions$sub, Klist=2:4, nbredo=1, maxit=5) 
plot(res)
summary(res)



