library(qat)


### Name: qat_plot_noc_rule_2d
### Title: Plot a NOC rule result
### Aliases: qat_plot_noc_rule_2d
### Keywords: ts

### ** Examples

vec <- array(c(1,1,1,2,2), c(25,20))
result <- qat_analyse_noc_rule_2d(vec, 1)
# this example produce a file exampleplot_noc.png in the current directory
qat_plot_noc_rule_2d(result$flagvector, "exampleplot_noc", measurement_vector=vec, 
max_return_elements=result$max_return_elements, measurement_name="Result of Check")



