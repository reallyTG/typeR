library(bnlearn)


### Name: node ordering utilities
### Title: Utilities dealing with partial node orderings
### Aliases: 'node ordering utilities' node.ordering ordering2blacklist
###   tiers2blacklist
### Keywords: convenience functions structure learning graphs

### ** Examples

data(learning.test)
res = gs(learning.test, optimized = TRUE)
ntests(res)
res = set.arc(res, "A", "B")
ord = node.ordering(res)
ord

## partial node ordering saves us two tests in the v-structure
## detection step of the algorithm.
ntests(gs(learning.test, blacklist = ordering2blacklist(ord)))

tiers2blacklist(list(LETTERS[1:3], LETTERS[4:6]))



