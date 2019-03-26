library(data.tree)


### Name: Prune
### Title: Prunes a tree.
### Aliases: Prune

### ** Examples

data(acme)
acme$Do(function(x) x$cost <- Aggregate(x, "cost", sum))
Prune(acme, function(x) x$cost > 700000)
print(acme, "cost")




