library(qat)


### Name: qat_analyse_histogram_test_kld_1d
### Title: Perform a histogram test with the metric KLD
### Aliases: qat_analyse_histogram_test_kld_1d
### Keywords: ts

### ** Examples

vec <- c(rnorm(1000), round(rnorm(1000)))
result <- qat_analyse_histogram_test_kld_1d(vec, 50, 65, 100)
qat_plot_histogram_test(result$field, "test_kld_1d", result$blocksize, 
result$numofbars, result$factorofbar, "kld", result$runs)



