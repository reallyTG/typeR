library(qat)


### Name: qat_analyse_histogram_test_jsd_2d
### Title: Perform a histogram test with the metric JSD
### Aliases: qat_analyse_histogram_test_jsd_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(1000), c(100, 20))
vec[51:100, ] <- round(vec[51:100, ])
result <- qat_analyse_histogram_test_jsd_2d(vec, 4, 65, 100)
qat_plot_histogram_test(result$field, "test_jsd_2d", result$blocksize, 
result$numofbars, result$factorofbar, "jsd", result$runs)



