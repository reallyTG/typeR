library(Perc)


### Name: simRankOrder
### Title: Find rank order using simulated annealing
### Aliases: simRankOrder

### ** Examples

# convert an edgelist to conflict matrix
confmatrix <- as.conflictmat(sampleEdgelist)
# find dominance probability matrix
perm2 <- conductance(confmatrix, maxLength = 2)
## Not run: 
##D # Note: It takes a while to run the simRankOrder example.
##D s.rank <- simRankOrder(perm2$p.hat, num = 10, kmax = 1000)
##D s.rank$BestSimulatedRankOrder
##D s.rank$Costs
##D s.rank$AllSimulatedRankOrder
## End(Not run)
## Don't show: 
s.rank <- simRankOrder(perm2$p.hat, num = 2, kmax = 5)
s.rank$BestSimulatedRankOrder
s.rank$Costs
s.rank$AllSimulatedRankOrder
## End(Don't show)



