library(qat)


### Name: qat_analyse_histogram_test_ms_2d
### Title: Perform a histogram test with the metric MS
### Aliases: qat_analyse_histogram_test_ms_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(1000), c(100, 20))
vec[51:100, ] <- vec[51:100, ] + 2
result <- qat_analyse_histogram_test_ms_2d(vec, 4, 65)
qat_plot_histogram_test(result$field, "test_ms_2d", result$blocksize, 
result$numofbars, "ms", result$runs)



