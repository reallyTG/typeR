library(arulesViz)


### Name: ruleExplorer
### Title: Explore Association Rules Interactively
### Aliases: ruleExplorer explore

### ** Examples

## Not run: 
##D data(Groceries)
##D 
##D # explore pre-mined rules
##D rules <- apriori(Groceries, parameter=list(support=0.001, confidence=0.8))
##D rules
##D 
##D ruleExplorer(rules)
##D 
##D # mine and explore rules on the fly
##D ruleExplorer(Groceries)
## End(Not run)



