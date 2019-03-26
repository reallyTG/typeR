library(tsModel)


### Name: tsdecomp
### Title: Time scale decomposition
### Aliases: tsdecomp
### Keywords: models

### ** Examples

x <- rnorm(101)
freq.x <- tsdecomp(x, c(1, 10, 30, 80))

## decompose x into 3 frequency categories.
## x[,1] represents from 1 to 9 cycles in 101 data points
## x[,2] represents from 10 to 29 cycles in 101 data points
## x[,3] represents from 30 to 50 cycles in 101 data points
## you can only have up to 50 cycles in 101 data points.



