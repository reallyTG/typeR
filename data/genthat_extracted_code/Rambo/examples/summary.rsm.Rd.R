library(Rambo)


### Name: summary.rsm
### Title: Summarizes results of Random Subgraph Model estimates.
### Aliases: summary.rsm
### Keywords: rsm

### ** Examples

data(Regions)
res <- rsm(Regions$X, Regions$sub, Klist=2:4, nbredo=1, maxit=5) 
summary(res)



