library(data.tree)


### Name: data.tree
### Title: data.tree: Hierarchical Data Structures
### Aliases: data.tree data.tree-package

### ** Examples

data(acme)
print(acme)
acme$fieldsAll
acme$count
acme$totalCount
acme$isRoot
acme$height
print(acme, "p", "cost")

outsource <- acme$IT$Outsource
class(outsource)
print(outsource)
outsource$fields
outsource$isLeaf
outsource$level
outsource$path
outsource$p
outsource$parent$name
outsource$root$name
outsource$expCost <- outsource$p * outsource$cost
print(acme, "expCost")

acme$Get("p")
acme$Do(function(x) x$expCost <- x$p * x$cost)
acme$Get("expCost", filterFun = isLeaf)

ToDataFrameTable(acme, "name", "p", "cost", "level", "pathString")
ToDataFrameTree(acme, "name", "p", "cost", "level")
ToDataFrameNetwork(acme, "p", "cost")





