library(qat)


### Name: qat_plot_lim_rule_static_1d
### Title: Plot a static lim rule result
### Aliases: qat_plot_lim_rule_static_1d
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
result <- qat_analyse_lim_rule_static_1d(vec, -2,2)
# this example produce a file exampleplot_lim_sta.png in the current directory
qat_plot_lim_rule_static_1d(result$flagvector, "exampleplot_lim_sta", 
measurement_vector=vec, min_value=result$min_value, max_value=result$max_value, 
measurement_name="Testresult")



