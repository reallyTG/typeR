library(convexjlr)


### Name: addConstraint
### Title: Add constraints to optimization problem
### Aliases: addConstraint

### ** Examples

## Not run: 
##D     convex_setup()
##D     x <- Variable(4)
##D     b <- J(c(1:4))
##D     p <- minimize(sum((x - b) ^ 2))
##D     p <- addConstraint(p, x >= 0, x <= 3)
## End(Not run)



