library(mbir)


### Name: boot_test
### Title: Bootstrap Confidence Intervals via Resampling
### Aliases: boot_test

### ** Examples

require(graphics)

a <- rnorm(25, 80, 35)
b <- rnorm(25, 100, 50)

boot_test(a, b, 0.95, 10000)



