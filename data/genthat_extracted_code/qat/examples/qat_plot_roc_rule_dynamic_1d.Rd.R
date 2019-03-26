library(qat)


### Name: qat_plot_roc_rule_dynamic_1d
### Title: Plot a dynamic ROC rule result
### Aliases: qat_plot_roc_rule_dynamic_1d
### Keywords: ts

### ** Examples

vec <- rnorm(100)
min_vector<-seq(1,2,length.out=100)
max_vector<-seq(1,2,length.out=100)
result <- qat_analyse_roc_rule_dynamic_1d(vec, min_vector, max_vector, 
upward_vector_name="upward vector", downward_vector_name="downward vector")
# this example produce a file exampleplot_roc_dyn.png in the current directory
qat_plot_roc_rule_dynamic_1d(result$flagvector, "exampleplot_roc_dyn", 
measurement_vector=vec, max_upward_vector=result$max_upward_vector, 
max_downward_vector=result$max_downward_vector, upward_vector_name=result$upward_vector_name, 
downward_vector_name=result$downward_vector_name, measurement_name="Result of Check") 



