library(Directional)


### Name: Uniformity test for circular data
### Title: Uniformity tests for circular data.
### Aliases: kuiper watson
### Keywords: Circular data Uniformity test Hypothesis testing

### ** Examples

x <- rvonmises(n = 40, m = 2, k = 10)
kuiper(x, rads = TRUE)
watson(x, rads = TRUE)
x <- rvonmises(40, m = 2, k = 0)
kuiper(x, rads = TRUE)
watson(x, rads = TRUE)



