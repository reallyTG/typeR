library(ri)


### Name: resresplot
### Title: Produces residual-residual (added-variable) plot
### Aliases: resresplot
### Keywords: avplot

### ** Examples

y <- c(8,6,2,0,3,1,1,1,2,2,0,1,0,2,2,4,1,1) 
Z <- c(1,1,0,0,1,1,0,0,1,1,1,1,0,0,1,1,0,0)
X <- c(1:18)
cluster <- c(1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9)
block <- c(rep(1,4),rep(2,6),rep(3,8))

probs <- genprobexact(Z,block,cluster) # generate probability of assignment

resresplot(y,Z,X,prob=probs,scale=3) # produce res-res plot



