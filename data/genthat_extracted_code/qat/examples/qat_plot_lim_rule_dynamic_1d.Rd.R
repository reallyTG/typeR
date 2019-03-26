library(qat)


### Name: qat_plot_lim_rule_dynamic_1d
### Title: Plot a dynamic LIM rule result
### Aliases: qat_plot_lim_rule_dynamic_1d
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
min_vector<-seq(-1,-2,length.out=1000)
max_vector<-seq(1,2,length.out=1000)
result <- qat_analyse_lim_rule_dynamic_1d(vec, min_vector, max_vector, 
min_vector_name="minimum vector", max_vector_name="maximum vector")
# this example produce a file exampleplot_lim_dyn.png in the current directory
qat_plot_lim_rule_dynamic_1d(result$flagvector, "exampleplot_lim_dyn", 
measurement_vector=vec, min_vector=result$min_vector, max_vector=result$max_vector, 
min_vector_name=result$min_vector_name, max_vector_name=result$max_vector_name, 
measurement_name="Result of Check")



