library(qat)


### Name: qat_call_plot_trimmed_distribution
### Title: Plot a result of a trimmed distribution check
### Aliases: qat_call_plot_trimmed_distribution
### Keywords: utilities

### ** Examples

vec <- rnorm(1000)
workflowlist_part <- list()
resultlist <- qat_call_trimmed_distribution(vec, workflowlist_part, element=1)
# this example produce a file exampleplot_1_trimmeddist.png in the current directory
qat_call_plot_trimmed_distribution(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



