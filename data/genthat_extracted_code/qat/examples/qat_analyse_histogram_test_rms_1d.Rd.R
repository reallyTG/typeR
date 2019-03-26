library(qat)


### Name: qat_analyse_histogram_test_rms_1d
### Title: Perform a histogram test with the metric RMS
### Aliases: qat_analyse_histogram_test_rms_1d
### Keywords: ts

### ** Examples

vec <- c(rnorm(1000), rnorm(1000)+2)
result <- qat_analyse_histogram_test_rms_1d(vec, 50, 65)
qat_plot_histogram_test(result$field, "test_rms_1d", result$blocksize, 
result$numofbars, "rms", result$runs)



