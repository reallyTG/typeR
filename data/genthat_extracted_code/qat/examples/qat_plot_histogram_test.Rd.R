library(qat)


### Name: qat_plot_histogram_test
### Title: Plot a histogram test result
### Aliases: qat_plot_histogram_test
### Keywords: ts

### ** Examples

	vec <- c(rnorm(1000), rnorm(1000)+1)
	result <- qat_analyse_histogram_test_emd_1d(vec, 50, 65)
	qat_plot_histogram_test(result$field, "test_emd_1d", result$blocksize, 
	result$numofbars, "emd", result$runs)



