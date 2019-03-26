library(data.tree)


### Name: Cumulate
### Title: Cumulate values among siblings
### Aliases: Cumulate

### ** Examples

data(acme)
acme$Do(function(x) x$cost <- Aggregate(x, "cost", sum), traversal = "post-order")
acme$Do(function(x) x$cumCost <- Cumulate(x, "cost", sum))
print(acme, "cost", "cumCost")




