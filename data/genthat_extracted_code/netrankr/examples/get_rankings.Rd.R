library(netrankr)


### Name: get_rankings
### Title: Rankings that extend a partial ranking
### Aliases: get_rankings

### ** Examples

P <- matrix(c(0,0,1,1,1,0,0,0,1,0,0,0,0,0,1,rep(0,10)),5,5,byrow=TRUE)
P
res <- exact_rank_prob(P,only.results = FALSE)
get_rankings(res)




