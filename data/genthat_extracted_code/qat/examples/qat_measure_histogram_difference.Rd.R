library(qat)


### Name: qat_measure_histogram_difference
### Title: Perform a comparison of two datasets by means of its histograms
###   with a given metric
### Aliases: qat_measure_histogram_difference
### Keywords: ts

### ** Examples

vec1 <- array(rnorm(1000), c(100, 20))
vec2 <- vec1 + 1
result <- qat_measure_histogram_difference(vec1, vec2, metric="EMD", numofbars=65)



