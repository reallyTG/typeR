library(qat)


### Name: qat_call_roc_rule
### Title: Perform a ROC Rule Check
### Aliases: qat_call_roc_rule
### Keywords: utilities

### ** Examples

vec <- rnorm(100)
downward_vector<-seq(1,2,length.out=1000)
upward_vector<-seq(1,2,length.out=1000)
workflowlist_part <- list(downward_value=2, upward_value=2,downward_vector="vec1", 
upward_vector="vec2",downward_vector_name="downward vector", upward_vector_name="upward vector")
result <- qat_call_roc_rule(vec, workflowlist_part,vec1=downward_vector,vec2=upward_vector)



