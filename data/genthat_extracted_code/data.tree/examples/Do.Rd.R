library(data.tree)


### Name: Do
### Title: Executes a function on a set of nodes
### Aliases: Do

### ** Examples

data(acme)
acme$Do(function(node) node$expectedCost <- node$p * node$cost)
print(acme, "expectedCost")




