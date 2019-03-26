library(qat)


### Name: qat_plot_distribution_1d
### Title: Plot a distribution check result
### Aliases: qat_plot_distribution_1d
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
result <- qat_analyse_distribution_1d(vec, 15)
# this example produce a file exampleplot_dist.png in the current directory
qat_plot_distribution_1d(result$hist, "exampleplot_dist", result$stat, 
numofbars=result$numofbars, measurement_name="Result of Check")	




