library(qat)


### Name: qat_plot_trimmed_distribution_1d
### Title: Plot a trimmed distribution check result
### Aliases: qat_plot_trimmed_distribution_1d
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
result <- qat_analyse_trimmed_distribution_1d(vec)
# this example produce a file exampleplot_trimmeddist.png in the current directory
qat_plot_trimmed_distribution_1d(result$stat, "exampleplot_trimmeddist", 
measurement_name="Result of Check")	



