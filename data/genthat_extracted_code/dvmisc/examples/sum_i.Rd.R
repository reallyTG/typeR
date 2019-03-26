library(dvmisc)


### Name: sum_i
### Title: Sum of Integer Values
### Aliases: sum_i

### ** Examples

# For very large integer objects, sum_i is faster than sum
x <- rpois(100000, lambda = 5)
sum(x) == sum_i(x)
benchmark(sum(x), sum_i(x), replications = 1000)

# For smaller integer objects, sum_i is slower than sum 
x <- rpois(1000, lambda = 5)
sum(x) == sum_i(x)
benchmark(sum(x), sum_i(x), replications = 1000)




