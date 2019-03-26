library(qat)


### Name: qat_call_plot_lim_rule
### Title: Plot a result of a LIM rule check
### Aliases: qat_call_plot_lim_rule
### Keywords: utilities

### ** Examples

vec <- rnorm(1000)
min_vector<-seq(-1,-2,length.out=1000)
max_vector<-seq(1,2,length.out=1000)
workflowlist_part <- list(minimum_value=-2, maximum_value=2,minimum_vector="vec1",
maximum_vector="vec2",minimum_vector_name="minimum vector",
maximum_vector_name="maximum vector", sigma_factor=2)
resultlist <- qat_call_lim_rule(vec, workflowlist_part, element=1, vec1=min_vector, 
vec2=max_vector)
# this example produce the files exampleplot_1_lim_sigma.png, exampleplot_1_lim_static.png
# and exampleplot_1_lim_dynamic.png in the current directory
for (ii in 2:4) {
	qat_call_plot_lim_rule(resultlist[[ii]], measurement_vector=vec, 
	measurement_name="Result of Check", basename="exampleplot")
}



