library(table1)


### Name: stats.apply.rounding
### Title: Apply rounding to basic descriptive statistics.
### Aliases: stats.apply.rounding
### Keywords: utilities

### ** Examples

x <- round(exp(rnorm(100, 1, 1)), 6)
stats.default(x)
stats.apply.rounding(stats.default(x), digits=3)
stats.apply.rounding(stats.default(round(x, 1)), digits=3)




