library(qat)


### Name: qat_call_plot_slide_distribution
### Title: Plot a result of a slide distribution check
### Aliases: qat_call_plot_slide_distribution
### Keywords: utilities

### ** Examples

vec <- rnorm(100)
workflowlist_part <- list(blocksize=10)
resultlist <- qat_call_slide_distribution(vec, workflowlist_part, element=1)	
# this example produce the files exampleplot_1_slidedist_1.png, exampleplot_1_slidedist_2.png 
# and exampleplot_1_slidedist_3.png in the current directory
qat_call_plot_slide_distribution(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



