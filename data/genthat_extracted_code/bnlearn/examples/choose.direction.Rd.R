library(bnlearn)


### Name: choose.direction
### Title: Try to infer the direction of an undirected arc
### Aliases: choose.direction
### Keywords: network scores independence tests resampling convenience
###   functions

### ** Examples

data(learning.test)
res = gs(learning.test)

## the arc A - B has no direction.
choose.direction(res, learning.test, arc = c("A", "B"), debug = TRUE)

## let's see score equivalence in action.
choose.direction(res, learning.test, criterion = "aic",
  arc = c("A", "B"), debug = TRUE)

## arcs which introduce cycles are handled correctly.
res = set.arc(res, "A", "B")
# now A -> B -> E -> A is a cycle.
choose.direction(res, learning.test, arc = c("E", "A"), debug = TRUE)

## Not run: 
##D choose.direction(res, learning.test, arc = c("D", "E"), criterion = "bootstrap",
##D   R = 100, algorithm = "iamb", algorithm.args = list(test = "x2"), cpdag = TRUE,
##D   debug = TRUE)
## End(Not run)


