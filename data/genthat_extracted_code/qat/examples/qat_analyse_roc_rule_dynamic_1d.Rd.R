library(qat)


### Name: qat_analyse_roc_rule_dynamic_1d
### Title: Perform a dynamic roc-rule-check
### Aliases: qat_analyse_roc_rule_dynamic_1d
### Keywords: ts

### ** Examples

vec <- rnorm(100)
min_vector<-seq(1,2,length.out=100)
max_vector<-seq(1,2,length.out=100)
result <- qat_analyse_roc_rule_dynamic_1d(vec, min_vector, max_vector, 
upward_vector_name="upward vector", downward_vector_name="downward vector")



