library(qat)


### Name: qat_plot_trimmed_distribution_2d
### Title: Plot a trimmed distribution check result
### Aliases: qat_plot_trimmed_distribution_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(100),c(25,20))
result <- qat_analyse_trimmed_distribution_2d(vec)
# this example produce a file exampleplot_trimmeddist.png in the current directory
qat_plot_trimmed_distribution_2d(result$stat, "exampleplot_trimmeddist", 
measurement_name="Result of Check")	



