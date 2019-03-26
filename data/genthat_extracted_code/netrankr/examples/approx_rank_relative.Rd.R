library(netrankr)


### Name: approx_rank_relative
### Title: Approximation of relative rank probabilities
### Aliases: approx_rank_relative

### ** Examples

P <- matrix(c(0,0,1,1,1,0,0,0,1,0,0,0,0,0,1,rep(0,10)),5,5,byrow=TRUE)
P
approx_rank_relative(P,iterative = FALSE) 
approx_rank_relative(P,iterative = TRUE)



