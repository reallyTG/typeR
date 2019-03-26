library(qat)


### Name: qat_plot_slide_distribution_1d
### Title: Plot a slide distribution check result
### Aliases: qat_plot_slide_distribution_1d
### Keywords: ts

### ** Examples

vec <- rnorm(100)
result <- qat_analyse_slide_distribution_1d(vec, 10)
# this example produce a file exampleplot_slidedist.png in the current directory
qat_plot_slide_distribution_1d(result$stat, "exampleplot_slidedist", 
blocksize=result$blocksize, measurement_name="Result of Check")		



