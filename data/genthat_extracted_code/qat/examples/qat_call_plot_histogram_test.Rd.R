library(qat)


### Name: qat_call_plot_histogram_test
### Title: Plot a result of a histogram test
### Aliases: qat_call_plot_histogram_test
### Keywords: utilities

### ** Examples

vec <- c(rnorm(1000), rnorm(1000)+1)
workflowlist_part <- list(blocksize=50, numofbars=65, metric="emd")
resultlist <- qat_call_histogram_test(vec, workflowlist_part, element=1)
# this example produce the file exampleplot_1_histogramtest_emd.png in the current 
# directory
qat_call_plot_histogram_test(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



