library(qat)


### Name: qat_call_plot_noc_rule
### Title: Plot a result of a NOC rule check
### Aliases: qat_call_plot_noc_rule
### Keywords: utilities

### ** Examples

vec <- c(1,2,3,4,4,4,5,5,4,3,NaN,3,2,1)
workflowlist_part <- list(max_return_elements=1)
resultlist <- qat_call_noc_rule(vec, workflowlist_part,element=1)
# this example produce a file exampleplot_1_noc.png in the current directory
qat_call_plot_noc_rule(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



