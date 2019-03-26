library(dvmisc)


### Name: var_i
### Title: Sample Variance for Integer Values
### Aliases: var_i

### ** Examples

# For integer vectors, var_i is typically much faster than var.
x <- rpois(1000, lambda = 5)
all.equal(var(x), var_i(x))
benchmark(var(x), var_i(x), replications = 5000)




