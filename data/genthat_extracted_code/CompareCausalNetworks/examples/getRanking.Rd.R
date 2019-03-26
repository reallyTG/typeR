library(CompareCausalNetworks)


### Name: getRanking
### Title: Estimate a ranking of edges for causal relations in the
###   underlying graph structure using stability ranking.
### Aliases: getRanking
### Keywords: Causality, Graph estimations

### ** Examples

data("simDataInv")
X <- simDataInv$X
set.seed(1)
if(require(pcalg)){
  rank <- getRanking(X,
                environment = simDataInv$environment,
                queries = c("isParent","isMaybeParent"),
                method = c("LINGAM"),
                verbose = FALSE)
  # estimated ranking
  print(rank$ranking$isParent)
 
  # true adjacency matrix
  print(simDataInv$configs$trueA)
}else{
  cat("\nThe packages 'pcalg' is needed for the example to
work. Please install it.")
}




