library(qat)


### Name: qat_plot_noc_rule_1d
### Title: Plot a NOC rule result
### Aliases: qat_plot_noc_rule_1d
### Keywords: ts

### ** Examples

vec <- c(1,2,3,4,4,4,5,5,4,3,NaN,3,2,1)
result <- qat_analyse_noc_rule_1d(vec, 1)
# this example produce a file exampleplot_noc.png in the current directory
qat_plot_noc_rule_1d(result$flagvector, "exampleplot_noc", measurement_vector=vec, 
max_return_elements=result$max_return_elements, measurement_name="Result of Check")



