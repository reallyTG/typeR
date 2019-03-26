library(ri)


### Name: genprobexact
### Title: Production of exact probabilities of treatment assignment for
###   blocked, clustered designs
### Aliases: genprobexact
### Keywords: randomization probability

### ** Examples

y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))

probs <- genprobexact(Z,block,cluster) # generate probability of assignment
ate <- estate(y,Z,prob=probs) # estimate the ATE; estimated ATE=2



