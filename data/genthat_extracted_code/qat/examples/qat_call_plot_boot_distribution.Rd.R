library(qat)


### Name: qat_call_plot_boot_distribution
### Title: Plot a result of a bootstrapped distribution check
### Aliases: qat_call_plot_boot_distribution
### Keywords: utilities

### ** Examples

vec <- rnorm(500)
workflowlist_part <- list(bootruns=100)
resultlist <- qat_call_boot_distribution(vec, workflowlist_part, element=1)
# this example produce the file exampleplot_1_bootdist.png in the current directory
qat_call_plot_boot_distribution(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



