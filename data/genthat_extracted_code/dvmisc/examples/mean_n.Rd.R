library(dvmisc)


### Name: mean_n
### Title: Mean of Numeric Values
### Aliases: mean_n

### ** Examples

# In general, mean_n is much faster than mean.
x <- rnorm(10000)
mean(x) == mean_n(x)
benchmark(mean(x), mean_n(x), replications = 1000)

# For very large integer objects, mean may be faster than mean_n. But then 
# mean_i should be even faster.
x <- rpois(100000, lambda = 5)
mean(x) == mean_n(x)
mean(x) == mean_i(x)
benchmark(mean(x), mean_n(x), mean_i(x), replications = 1000)




