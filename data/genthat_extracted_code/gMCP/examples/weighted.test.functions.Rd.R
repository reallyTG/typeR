library(gMCP)


### Name: weighted.test.functions
### Title: Weighted Test Functions for use with gMCP
### Aliases: weighted.test.functions

### ** Examples


# The test function 'bonferroni.test' is used in by gMCP in the following call:
graph <- BonferroniHolm(4)
pvalues <- c(0.01, 0.05, 0.03, 0.02)
alpha <- 0.05
r <- gMCP.extended(graph=graph, pvalues=pvalues, test=bonferroni.test, verbose=TRUE)

# For the intersection of all four elementary hypotheses this results in a call
bonferroni.test(pvalues=pvalues, weights=getWeights(graph))
bonferroni.test(pvalues=pvalues, weights=getWeights(graph), adjPValues=FALSE)

# bonferroni.test function: 
bonferroni.test <- function(pvalues, weights, alpha=0.05, adjPValues=TRUE, verbose=FALSE, ...) {
  if (adjPValues) {
    return(min(pvalues/weights))
  } else {
    return(any(pvalues<=alpha*weights))
  }
}




