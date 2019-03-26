library(mcMST)


### Name: mcMSTEmoaBG
### Title: Subgraph EMOA for the multi-criteria MST problem.
### Aliases: mcMSTEmoaBG

### ** Examples

inst = genRandomMCGP(10)
res = mcMSTEmoaBG(inst, mu = 20L, max.iter = 100L)
print(res$pareto.front)
print(tail(getStatistics(res$log)))



