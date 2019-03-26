library(table1)


### Name: stats.default
### Title: Compute some basic descriptive statistics.
### Aliases: stats.default
### Keywords: utilities

### ** Examples

x <- exp(rnorm(100, 1, 1))
stats.default(x)

y <- factor(sample(0:1, 99, replace=TRUE), labels=c("Female", "Male"))
y[1:10] <- NA
stats.default(y)
stats.default(is.na(y))




