library(hitandrun)


### Name: hypersphere.sample
### Title: Sample uniformly from an n-hypersphere
### Aliases: hypersphere.sample
### Keywords: hypersphere uniform sampling

### ** Examples

n <- 3 # Dimension
N <- 5 # Nr samples

sample <- hypersphere.sample(n, N)

# Check summing to unity
vec.norm <- function(x) { sum(x^2) }
stopifnot(all.equal(apply(sample, 1, vec.norm), rep(1, N)))



