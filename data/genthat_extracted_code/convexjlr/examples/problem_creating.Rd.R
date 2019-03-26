library(convexjlr)


### Name: problem_creating
### Title: Create optimization problem
### Aliases: problem_creating minimize maximize satisfy

### ** Examples

## Not run: 
##D     convex_setup()
##D     x <- Variable(4)
##D     b <- J(c(1:4))
##D     p <- minimize(sum((x - b) ^ 2), x >= 0, x <= 3)
##D     p <- maximize(-sum((x - b) ^ 2), x >= 0, x <= 3)
##D     p <- satisfy(sum((x - b) ^ 2) <= 1, x >= 0, x <= 3)
## End(Not run)



