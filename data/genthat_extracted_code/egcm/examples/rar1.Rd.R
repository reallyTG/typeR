library(egcm)


### Name: rar1
### Title: Random AR(1) vector
### Aliases: rar1
### Keywords: ts

### ** Examples

rar1(100, 0, 0)          # Equivalent to rnorm(100)
rar1(100, 0, 1)          # Equivalent to cumsum(rnorm(100))
acor(rar1(100, 1, .5))   # Should be about 0.5
tseries::adf.test(rar1(100, 0, .5))  # Should have a low p-value



