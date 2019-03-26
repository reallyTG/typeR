library(admixturegraph)


### Name: add_a_leaf
### Title: Adds a new leaf to a graph.
### Aliases: add_a_leaf

### ** Examples

## No test: 
# Take a look at how much trees there are: 
leaves <- c("1", "2")
inner_nodes <- c("R")
edges <- parent_edges(c(edge("1", "R"), edge("2", "R")))
admixtures <- NULL
Lambda <- agraph(leaves, inner_nodes, edges, admixtures)
set <- list(Lambda)
for (i in seq(1, 6)) {
  new_set <- list()
  for (tree in set) {
    new_set <- c(new_set, add_a_leaf(tree, paste(i + 2)))
  }
  set <- new_set
  cat("There are ")
  cat(length(set))
  cat(" different trees with ")
  cat(i + 2)
  cat(" labeled leaves.")
  cat("\n")
}
# In general, there are 1*3*5*...*(2n - 5) different trees with n labeled leaves
# (A001147 in the online encyclopedia of integer sequences).
# Exhaustive search through the graph space is hard!
## End(No test)




