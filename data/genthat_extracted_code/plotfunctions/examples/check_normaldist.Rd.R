library(plotfunctions)


### Name: check_normaldist
### Title: Compare distribution of data with normal distribution.
### Aliases: check_normaldist

### ** Examples

set.seed(123)
# normal distribution:
test <- rnorm(1000)
check_normaldist(test)
# t-distribution:
test <- rt(1000, df=5)
check_normaldist(test)
# skewed data, e.g., reaction times:
test <- exp(rnorm(1000, mean=.500, sd=.25))
check_normaldist(test)
# center first:
check_normaldist(scale(test))
# binomial distribution:
test <- rbinom(1000, 1, .3)
check_normaldist(test)
# count data:
test <- rbinom(1000, 100, .3)
check_normaldist(test)



