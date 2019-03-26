library(tseries)


### Name: bds.test
### Title: BDS Test
### Aliases: bds.test print.bdstest
### Keywords: ts

### ** Examples

x <- rnorm(100)
bds.test(x)  # i.i.d. example

x <- c(rnorm(50), runif(50))
bds.test(x)  # not identically distributed

x <- quadmap(xi = 0.2, a = 4.0, n = 100)
bds.test(x)  # not independent



