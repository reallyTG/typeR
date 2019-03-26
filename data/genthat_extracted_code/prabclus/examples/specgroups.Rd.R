library(prabclus)


### Name: specgroups
### Title: Average within-group distances for given groups
### Aliases: specgroups
### Keywords: cluster

### ** Examples

  options(digits=4)
  data(siskiyou)
  x <- prabinit(prabmatrix=siskiyou, neighborhood=siskiyou.nb,
              distance="logkulczynski")  
  groupvector <- as.factor(siskiyou.groups)
  ng <- length(levels(groupvector))
  lg <- levels(groupvector)
  nsg <- numeric(0)
    for (i in 1:ng) nsg[i] <- sum(groupvector==lg[i])
  groupinfo <- list(lg=lg,ng=ng,nsg=nsg)
  specgroups(x$distmat,groupvector,groupinfo)



