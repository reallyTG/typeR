library(hitandrun)


### Name: simplex.sample
### Title: Sample uniformly from a simplex
### Aliases: simplex.sample
### Keywords: simplex uniform sampling

### ** Examples

n <- 3
N <- 10000
samples <- simplex.sample(n, N)$samples

# Check dimension
stopifnot(dim(samples) == c(N, n))

# Check that w_i >= 0
stopifnot(samples >= 0)

# Check that sum_i w_i = 1
E <- 1E-12
stopifnot(apply(samples, 1, sum) > 1 - E)
stopifnot(apply(samples, 1, sum) < 1 + E)


## Now with descending order
samples <- simplex.sample(n, N, sort=TRUE)$samples

# Check dimension
stopifnot(dim(samples) == c(N, n))

# Check that w_i >= 0
stopifnot(samples >= 0)

# Check that sum_i w_i = 1
E <- 1E-12
stopifnot(apply(samples, 1, sum) > 1 - E)
stopifnot(apply(samples, 1, sum) < 1 + E)

# Check w_i >= w_{i+1}
stopifnot(samples[,1] >= samples[,2])
stopifnot(samples[,2] >= samples[,3])



