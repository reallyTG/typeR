library(qat)


### Name: qat_plot_lim_rule_sigma_2d
### Title: Plot a sigma LIM rule result
### Aliases: qat_plot_lim_rule_sigma_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(500), c(25,20))
result <- qat_analyse_lim_rule_sigma_2d(vec, 2)
# this example produce a file exampleplot_lim_sig.png in the current directory
qat_plot_lim_rule_sigma_2d(result$flagvector, "exampleplot_lim_sig", 
measurement_vector=vec, sigma_factor=result$sigma_factor, 
meanofvector=result$meanofvector, sdofvector=result$sdofvector, 
measurement_name="Result of Check")



