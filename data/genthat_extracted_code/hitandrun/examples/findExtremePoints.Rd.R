library(hitandrun)


### Name: findExtremePoints
### Title: Find extreme points
### Aliases: findExtremePoints
### Keywords: seed point

### ** Examples

# constraints: x_1 >= 0, x_2 >= 0, x_1 + x_2 <= 1
A <- rbind(c(-1, 0), c(0, -1), c(1, 1))
b <- c(0, 0, 1)
d <- c("<=", "<=", "<=")
constr <- list(constr=A, rhs=b, dir=d)

findExtremePoints(constr, homogeneous=FALSE)



