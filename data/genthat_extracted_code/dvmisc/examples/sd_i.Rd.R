library(dvmisc)


### Name: sd_i
### Title: Sample Standard Deviation for Integer Values
### Aliases: sd_i

### ** Examples

# For integer vectors, var_i is typically much faster than var.
x <- rpois(1000, lambda = 5)
all.equal(sd(x), sd_i(x))
benchmark(sd(x), sd_i(x), replications = 2000)




