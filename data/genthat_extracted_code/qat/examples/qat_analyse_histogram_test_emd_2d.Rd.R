library(qat)


### Name: qat_analyse_histogram_test_emd_2d
### Title: Perform a histogram test with the metric EMD
### Aliases: qat_analyse_histogram_test_emd_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(1000), c(100, 20))
vec[51:100, ] <- vec[51:100, ] + 1
result <- qat_analyse_histogram_test_emd_2d(vec, 4, 65)
qat_plot_histogram_test(result$field, "test_emd_2d", result$blocksize, 
result$numofbars, "emd", result$runs)



