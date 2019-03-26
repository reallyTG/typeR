library(qat)


### Name: qat_plot_block_distribution_1d
### Title: Plot a block distribution check result
### Aliases: qat_plot_block_distribution_1d
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
result <- qat_analyse_block_distribution_1d(vec, 50)
# this example produce a file exampleplot_blockdist.png in the current directory
qat_plot_block_distribution_1d(result$stat, "exampleplot_blockdist", 
blocksize=result$blocksize, measurement_name="Result of Check")		



