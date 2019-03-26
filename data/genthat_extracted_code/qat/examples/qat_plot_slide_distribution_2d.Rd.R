library(qat)


### Name: qat_plot_slide_distribution_2d
### Title: Plot a slide distribution check result
### Aliases: qat_plot_slide_distribution_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(100),c(25,20))
result <- qat_analyse_slide_distribution_2d(vec, 5)
# this example produce a file exampleplot_slidedist.png in the current directory
qat_plot_slide_distribution_2d(result$stat, "exampleplot_slidedist", 
blocksize=result$blocksize, measurement_name="Result of Check")		



