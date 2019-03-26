library(qat)


### Name: qat_plot_roc_rule_static_1d
### Title: Plot a static ROC rule result
### Aliases: qat_plot_roc_rule_static_1d
### Keywords: ts

### ** Examples

vec <- rnorm(100)
result <- qat_analyse_roc_rule_static_1d(vec, 2,2)
# this example produce a file exampleplot_roc_sta.png in the current directory
qat_plot_roc_rule_static_1d(result$flagvector, "exampleplot_roc_sta", 
measurement_vector=vec, max_upward_value=result$max_upward_value, 
max_downward_value=result$max_downward_value, measurement_name="Result of Check") 



