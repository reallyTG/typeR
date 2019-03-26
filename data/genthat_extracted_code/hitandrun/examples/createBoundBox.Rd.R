library(hitandrun)


### Name: createBoundBox
### Title: Calculate a bounding box
### Aliases: createBoundBox
### Keywords: bounding box

### ** Examples

# constraints: x_1 >= 0, x_2 >= 0, x_1 + x_2 <= 1
A <- rbind(c(-1, 0), c(0, -1), c(1, 1))
b <- c(0, 0, 1)
d <- c("<=", "<=", "<=")
constr <- list(constr=A, rhs=b, dir=d)

bb <- createBoundBox(constr)
stopifnot(bb$lb == c(0.0, 0.0))
stopifnot(bb$ub == c(1.0, 1.0))



