library(tseries)


### Name: adf.test
### Title: Augmented Dickey-Fuller Test
### Aliases: adf.test
### Keywords: ts

### ** Examples

x <- rnorm(1000)  # no unit-root
adf.test(x)

y <- diffinv(x)   # contains a unit-root
adf.test(y)



