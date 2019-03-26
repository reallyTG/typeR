library(qat)


### Name: qat_call_plot_block_distribution
### Title: Plot a result of a block distribution check
### Aliases: qat_call_plot_block_distribution
### Keywords: utilities

### ** Examples

vec <- rnorm(1000)
workflowlist_part <- list(blocksize=50)
resultlist <- qat_call_block_distribution(vec, workflowlist_part, element=1)	
# this example produce the files exampleplot_1_blockdist_1.png, exampleplot_1_blockdist_2.png
# and exampleplot_1_blockdist_3.png in the current directory
qat_call_plot_block_distribution(resultlist[[2]], measurement_vector=vec, 
measurement_name="Result of Check", basename="exampleplot")



