library(dvmisc)


### Name: sd_n
### Title: Sample Standard Deviation for Numeric Values
### Aliases: sd_n

### ** Examples

# In general, sd_n is much faster than sd.
x <- rnorm(1000)
all.equal(sd(x), sd_n(x))
benchmark(sd(x), sd_n(x), replications = 2000) 

# For integer vectors, sd_i should be even faster.
x <- rpois(1000, lambda = 5)
all.equal(sd(x), sd_i(x))
benchmark(sd(x), sd_n(x), sd_i(x), replications = 2000)




