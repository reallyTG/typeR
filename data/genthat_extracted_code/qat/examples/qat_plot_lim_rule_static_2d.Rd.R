library(qat)


### Name: qat_plot_lim_rule_static_2d
### Title: Plot a static lim rule result
### Aliases: qat_plot_lim_rule_static_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(500),c(25,20))
result <- qat_analyse_lim_rule_static_2d(vec, -2, 2)
# this example produce a file exampleplot_lim_sta.png in the current directory
qat_plot_lim_rule_static_2d(result$flagvector, "exampleplot_lim_sta", 
measurement_vector=vec, min_value=result$min_value, max_value=result$max_value, 
measurement_name="Testresult")



