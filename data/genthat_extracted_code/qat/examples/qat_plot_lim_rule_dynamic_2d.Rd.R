library(qat)


### Name: qat_plot_lim_rule_dynamic_2d
### Title: Plot a dynamic LIM rule result
### Aliases: qat_plot_lim_rule_dynamic_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(500),c(25,20))
min_vector <- array(rnorm(500)-2, c(25,20))
max_vector <- array(rnorm(500)+2, c(25,20))
result <- qat_analyse_lim_rule_dynamic_2d(vec, min_vector, max_vector, 
min_vector_name="minimum vector", max_vector_name="maximum vector")
# this example produce a file exampleplot_lim_dyn.png in the current directory
qat_plot_lim_rule_dynamic_2d(result$flagvector, "exampleplot_lim_dyn", 
measurement_vector=vec, min_vector=result$min_vector, max_vector=result$max_vector, 
min_vector_name=result$min_vector_name, max_vector_name=result$max_vector_name, 
measurement_name="Result of Check")



