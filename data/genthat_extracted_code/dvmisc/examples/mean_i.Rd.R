library(dvmisc)


### Name: mean_i
### Title: Mean of Integer Values
### Aliases: mean_i

### ** Examples

# For integer objects, mean_i is typically much faster than mean.
x <- rpois(100, lambda = 5)
mean(x) == mean_i(x)
benchmark(mean(x), mean_i(x), replications = 10000)




