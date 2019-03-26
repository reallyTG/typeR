library(qat)


### Name: qat_plot_lim_rule_sigma_1d
### Title: Plot a sigma LIM rule result
### Aliases: qat_plot_lim_rule_sigma_1d
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
result <- qat_analyse_lim_rule_sigma_1d(vec, 2)
# this example produce a file exampleplot_lim_sig.png in the current directory
qat_plot_lim_rule_sigma_1d(result$flagvector, "exampleplot_lim_sig", measurement_vector=vec, 
sigma_factor=result$sigma_factor, meanofvector=result$meanofvector, sdofvector=result$sdofvector, 
measurement_name="Result of Check")



