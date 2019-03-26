library(data.tree)


### Name: Sort
### Title: Sort children of a 'Node' or an entire 'data.tree' structure
### Aliases: Sort

### ** Examples

data(acme)
acme$Do(function(x) x$totalCost <- Aggregate(x, "cost", sum), traversal = "post-order")
Sort(acme, "totalCost", decreasing = FALSE)
print(acme, "totalCost")




