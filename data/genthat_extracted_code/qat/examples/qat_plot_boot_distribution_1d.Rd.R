library(qat)


### Name: qat_plot_boot_distribution_1d
### Title: Plot a bootstrapped distribution check result
### Aliases: qat_plot_boot_distribution_1d
### Keywords: ts

### ** Examples

vec <- rnorm(500)
result <- qat_analyse_boot_distribution_1d(vec, 100)
# this example produce a file exampleplot_bootdist.png in the current directory
qat_plot_boot_distribution_1d(result$stat, "exampleplot_bootdist", 
bootruns=result$bootruns, measurement_name="Result of Check")



