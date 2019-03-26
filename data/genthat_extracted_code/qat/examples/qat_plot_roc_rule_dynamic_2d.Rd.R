library(qat)


### Name: qat_plot_roc_rule_dynamic_2d
### Title: Plot a dynamic ROC rule result
### Aliases: qat_plot_roc_rule_dynamic_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(500), c(25,20))
min_vector <- array(rnorm(500)+2, c(25,20))
max_vector <- array(rnorm(500)+2, c(25,20))
result <- qat_analyse_roc_rule_dynamic_2d(vec, min_vector, max_vector, 
upward_vector_name="upward vector", downward_vector_name="downward vector")
# this example produce a file exampleplot_roc_dyn.png in the current directory
qat_plot_roc_rule_dynamic_2d(result$flagvector, "exampleplot_roc_dyn", 
measurement_vector=vec, max_upward_vector=result$max_upward_vector, 
max_downward_vector=result$max_downward_vector, upward_vector_name=result$upward_vector_name, 
downward_vector_name=result$downward_vector_name, measurement_name="Result of Check") 



