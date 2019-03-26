library(qat)


### Name: qat_plot_roc_rule_static_2d
### Title: Plot a static ROC rule result
### Aliases: qat_plot_roc_rule_static_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(500), c(25,20))
result <- qat_analyse_roc_rule_static_2d(vec, 2,2)
# this example produce a file exampleplot_roc_sta.png in the current directory
qat_plot_roc_rule_static_2d(result$flagvector, "exampleplot_roc_sta", 
measurement_vector=vec, max_upward_value=result$max_upward_value, 
max_downward_value=result$max_downward_value, measurement_name="Result of Check") 



