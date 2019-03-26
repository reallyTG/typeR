library(hitandrun)


### Name: simplex.createConstraints
### Title: Create constraints that define the (n-1)-simplex
### Aliases: simplex.createConstraints
### Keywords: simplex constraint constraint

### ** Examples

n <- 3
userConstr <- mergeConstraints(
	ordinalConstraint(3, 1, 2), ordinalConstraint(3, 2, 3))

transform <- simplex.createTransform(n)
constr <- simplex.createConstraints(transform, userConstr)
seedPoint <- createSeedPoint(constr, homogeneous=TRUE)

N <- 10000
samples <- har(seedPoint, constr, N, 1, homogeneous=TRUE, transform=transform)$samples

# Check dimension
stopifnot(dim(samples) == c(N, n))

# Check that w_i >= w_i+1
stopifnot(sapply(1:(n-1), function(i) {
	all(samples[,i]>=samples[,i+1])
}))

# Check that w_i >= 0
stopifnot(samples >= 0)

# Check that sum_i w_i = 1
E <- 1E-12
stopifnot(apply(samples, 1, sum) > 1 - E)
stopifnot(apply(samples, 1, sum) < 1 + E)



