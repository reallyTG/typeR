library(hitandrun)


### Name: harConstraints
### Title: Constraint formulation utility functions
### Aliases: harConstraints simplexConstraints lowerBoundConstraint
###   upperBoundConstraint lowerRatioConstraint upperRatioConstraint
###   exactRatioConstraint ordinalConstraint mergeConstraints
### Keywords: hit-and-run constraint

### ** Examples

# create an ordinal constraint
c1 <- ordinalConstraint(2, 1, 2)
stopifnot(c1$constr == c(-1, 1))
stopifnot(c1$rhs == c(0))
stopifnot(c1$dir == c("<="))

# create our own constraints
c2 <- list(constr=t(c(-1, 0)), rhs=c(0), dir=c("<="))
c3 <- list(constr=t(c(1, 1)), rhs=c(1), dir=c("<="))

# merge the constraints into a single definition
c <- mergeConstraints(c1, c2, c3)
stopifnot(c$constr == rbind(c(-1, 1), c(-1, 0), c(1, 1)))
stopifnot(c$rhs == c(0, 0, 1))
stopifnot(c$dir == c("<=", "<=", "<="))

# test the alternative (list) method
l <- mergeConstraints(list(c1, c2, c3))
stopifnot(c$constr == l$constr)
stopifnot(c$rhs == l$rhs)
stopifnot(c$dir == l$dir)

# test iteratively merging
l <- mergeConstraints(mergeConstraints(c1, c2), c3)
stopifnot(c$constr == l$constr)
stopifnot(c$rhs == l$rhs)
stopifnot(c$dir == l$dir)



