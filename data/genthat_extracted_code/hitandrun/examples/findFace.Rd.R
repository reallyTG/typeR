library(hitandrun)


### Name: findFace
### Title: Find the closest face (constraint) to an interior point of a
###   polytope.
### Aliases: findFace

### ** Examples

# constraints: x_1 >= 0, x_2 >= 0, x_1 + x_2 <= 1
A <- rbind(c(-1, 0), c(0, -1), c(1, 1))
b <- c(0, 0, 1)
d <- c("<=", "<=", "<=")
constr <- list(constr=A, rhs=b, dir=d)

stopifnot(findFace(c(0.1, 0.2), constr) == 1)
stopifnot(findFace(c(0.2, 0.1), constr) == 2)
stopifnot(findFace(c(0.4, 0.4), constr) == 3)



