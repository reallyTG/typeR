library(DStree)


### Name: prune.DStree
### Title: Prune a fitted survival tree
### Aliases: prune.DStree

### ** Examples

data(cost)
## Discretize observed days to years
d.cost <- dis.cost(cost)

##Build tree
tree <- DStree(time~prevStroke+age+sex+alcohol+smoke,status="status",data=d.cost)

# Determine subtree with minimum AIC
prunedtree <- prune(tree,d.cost,which="CRIT")
prunedtree$prunedfit

# Visualize AIC/Deviance of subtrees
plot(prunedtree$nsplit,prunedtree$CRIT)
plot(prunedtree$nsplit,prunedtree$DEV)



