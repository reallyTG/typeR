library(netrankr)


### Name: exact_rank_prob
### Title: Probabilistic centrality rankings
### Aliases: exact_rank_prob

### ** Examples

P <- matrix(c(0,0,1,1,1,0,0,0,1,0,0,0,0,0,1,rep(0,10)),5,5,byrow=TRUE)
P
res <- exact_rank_prob(P)

#a warning is displayed if only one ranking is possible
tg <- threshold_graph(20,0.2)
P <- neighborhood_inclusion(tg)
res <- exact_rank_prob(P)



