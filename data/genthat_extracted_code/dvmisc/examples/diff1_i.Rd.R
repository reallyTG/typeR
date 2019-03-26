library(dvmisc)


### Name: diff1_i
### Title: 1-Unit Lagged Differences for Integer Values
### Aliases: diff1_i

### ** Examples

# diff1_i is typically much faster than diff
x <- rpois(1000, lambda = 5)
all.equal(diff(x), diff1_i(x))
benchmark(diff(x), diff1_i(x), replications = 2000)




