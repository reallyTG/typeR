library(qat)


### Name: qat_call_plot_distribution
### Title: Plot a result of a distribution check
### Aliases: qat_call_plot_distribution
### Keywords: utilities

### ** Examples

vec <- rnorm(1000)
workflowlist_part <- list(numofbars=15)
resultlist <- qat_call_distribution(vec, workflowlist_part, element=1)	
# this example produce a file exampleplot_1_dist.png in the current directory
qat_call_plot_distribution(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



