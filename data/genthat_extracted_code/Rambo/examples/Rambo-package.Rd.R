library(Rambo)


### Name: Rambo-package
### Title: The Random Subgraph Model
### Aliases: Rambo-package Rambo RAMBO
### Keywords: rsm

### ** Examples

data(Regions)
res <- rsm(Regions$X, Regions$sub, Klist=2:4, nbredo=1, maxit=5) 
plot(res)
## summary(res)



