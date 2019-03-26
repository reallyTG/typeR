library(qat)


### Name: qat_plot_block_distribution_2d
### Title: Plot a block distribution check result
### Aliases: qat_plot_block_distribution_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(500),c(25,20))
result <- qat_analyse_block_distribution_2d(vec, 5)
# this example produce a file exampleplot_blockdist.png in the current directory
qat_plot_block_distribution_2d(result$stat, "exampleplot_blockdist", 
blocksize=result$blocksize, measurement_name="Result of Check")		



