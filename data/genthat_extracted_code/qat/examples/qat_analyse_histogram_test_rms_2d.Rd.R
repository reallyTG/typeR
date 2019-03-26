library(qat)


### Name: qat_analyse_histogram_test_rms_2d
### Title: Perform a histogram test with the metric RMS
### Aliases: qat_analyse_histogram_test_rms_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(1000), c(100, 20))
vec[51:100, ] <- vec[51:100, ] + 2
result <- qat_analyse_histogram_test_rms_2d(vec, 4, 65)
qat_plot_histogram_test(result$field, "test_rms_2d", result$blocksize, 
result$numofbars, "rms", result$runs)



