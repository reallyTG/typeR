library(netrankr)


### Name: approx_rank_expected
### Title: Approximation of expected ranks
### Aliases: approx_rank_expected

### ** Examples

P <- matrix(c(0,0,1,1,1,0,0,0,1,0,0,0,0,0,1,rep(0,10)),5,5,byrow=TRUE)
#Exact result
exact_rank_prob(P)$expected.rank

approx_rank_expected(P,method = 'lpom')
approx_rank_expected(P,method = 'glpom')



