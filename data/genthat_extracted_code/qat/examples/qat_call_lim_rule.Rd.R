library(qat)


### Name: qat_call_lim_rule
### Title: Perform a LIM Rule Check
### Aliases: qat_call_lim_rule
### Keywords: utilities

### ** Examples

vec <- rnorm(1000)
min_vector<-seq(-1,-2,length.out=1000)
max_vector<-seq(1,2,length.out=1000)
workflowlist_part <- list(minimum_value=-2, maximum_value=2,minimum_vector="vec1",
maximum_vector="vec2",minimum_vector_name="minimum vector",maximum_vector_name="maximum vector",
sigma_factor=2)
result <- qat_call_lim_rule(vec, workflowlist_part, vec1=min_vector, vec2=max_vector)



