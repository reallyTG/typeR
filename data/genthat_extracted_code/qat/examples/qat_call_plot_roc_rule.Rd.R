library(qat)


### Name: qat_call_plot_roc_rule
### Title: Plot a result of a ROC rule check
### Aliases: qat_call_plot_roc_rule
### Keywords: utilities

### ** Examples

vec <- rnorm(100)
downward_vector<-seq(1,2,length.out=100)
upward_vector<-seq(1,2,length.out=100)
workflowlist_part <- list(downward_value=2, upward_value=2,downward_vector="vec1",
upward_vector="vec2",downward_vector_name="downward vector", 
upward_vector_name="upward vector")
resultlist <- qat_call_roc_rule(vec, workflowlist_part, element=1, vec1=downward_vector, 
vec2=upward_vector)
# this example produce the files exampleplot_1_roc_static.png and 
# exampleplot_1_roc_dynamic.png in the current directory
for (ii in 2:3) {
qat_call_plot_roc_rule(resultlist[[ii]], measurement_vector=vec,
measurement_name="Result of Check", basename="exampleplot")
}



