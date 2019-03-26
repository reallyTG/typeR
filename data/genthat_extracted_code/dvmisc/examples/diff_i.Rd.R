library(dvmisc)


### Name: diff_i
### Title: Lagged Differences for Integer Values
### Aliases: diff_i

### ** Examples

# diff_i is typically much faster than diff
x <- rpois(1000, lambda = 5)
all.equal(diff(x, 2), diff_i(x, 2))
benchmark(diff(x, 2), diff_i(x, 2), replications = 2000)




