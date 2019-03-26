library(mded)


### Name: mded
### Title: Measuring the difference between two empirical distributions
### Aliases: mded print.mded
### Keywords: htest

### ** Examples

set.seed(123)
x <- rnorm(100, 3)
y <- rnorm(100, 1)

out <- mded(distr1 = x, distr2 = y, detail = TRUE)
out



