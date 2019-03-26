library(hitandrun)


### Name: bbReject
### Title: Bounding box rejection sampler
### Aliases: bbReject
### Keywords: bounding box uniform sampling

### ** Examples

# constraints: x_1 >= 0, x_2 >= 0, x_1 + x_2 <= 1
A <- rbind(c(-1, 0), c(0, -1), c(1, 1))
b <- c(0, 0, 1)
d <- c("<=", "<=", "<=")
constr <- list(constr=A, rhs=b, dir=d)

# create a bounding box that contains the polytope
lb <- c(0, 0)
ub <- c(1, 1)

# sample 10,000 points
samples <- bbReject(lb, ub, constr, 1E4)$samples

# Check dimension of result
stopifnot(dim(samples) == c(1E4, 2))

# Check that x_i >= 0
stopifnot(samples >= 0)

# Check that x_1 + x_2 <= 1
stopifnot(samples[,1] + samples[,2] <= 1)

## Not run: plot(samples)




