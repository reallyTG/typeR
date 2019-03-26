library(qat)


### Name: qat_analyse_roc_rule_dynamic_2d
### Title: Perform a dynamic roc-rule-check
### Aliases: qat_analyse_roc_rule_dynamic_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(100),c(5,20))
min_vector<-array(rnorm(100)+2,c(5,20))
max_vector<-array(rnorm(100)+2,c(5,20))
result <- qat_analyse_roc_rule_dynamic_2d(vec, min_vector, max_vector, upward_vector_name=
"upward vector", downward_vector_name="downward vector")



