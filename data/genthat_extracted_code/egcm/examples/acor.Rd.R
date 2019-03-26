library(egcm)


### Name: acor
### Title: autocorrelation
### Aliases: acor
### Keywords: ts

### ** Examples

acor(1:10)                # a perfect correlation
acor(rnorm(100))          # should be close to zero
acor(cumsum(rnorm(100)))  # slightly less than one
acor(rar1(1000, a1=0.8))  # slightly less than 0.8
acor(rar1(1000, a1=0.8), k=2)  # about 0.64
acor(rar1(1000, a1=0.8), k=3)  # about 0.51



