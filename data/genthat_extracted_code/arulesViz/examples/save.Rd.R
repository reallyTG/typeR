library(arulesViz)


### Name: saveAsGraph
### Title: Save rules or itemsets as a graph description
### Aliases: saveAsGraph
### Keywords: file

### ** Examples

data("Groceries")
rules <- apriori(Groceries, parameter=list(support=0.01, confidence=0.5))

saveAsGraph(rules, "rules.graphml")

## clean up
unlink("rules.graphml")



