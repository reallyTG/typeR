library(hitandrun)


### Name: findVertices
### Title: Find vertices of the polytope
### Aliases: findVertices
### Keywords: seed point

### ** Examples

# constraints: x_1 >= 0, x_2 >= 0, x_1 + x_2 <= 1
A <- rbind(c(-1, 0), c(0, -1), c(1, 1))
b <- c(0, 0, 1)
d <- c("<=", "<=", "<=")
constr <- list(constr=A, rhs=b, dir=d)

findVertices(constr, homogeneous=FALSE)



