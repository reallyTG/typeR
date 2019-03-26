library(ConsRank)


### Name: EMCons
### Title: Branch-and-bound algorithm to find consensus (median) ranking
###   according to the Kemeny's axiomatic approach
### Aliases: EMCons
### Keywords: Consensus median ranking

### ** Examples

data(Idea)
RevIdea=6-Idea 
# as 5 means "most associated", it is necessary compute the reverse ranking of 
# each rankings to have rank 1 = "most associated" and rank 5 = "least associated"
CR=EMCons(RevIdea)




