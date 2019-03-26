library(qat)


### Name: qat_analyse_lim_rule_dynamic_2d
### Title: Perform a dynamic lim-rule-check
### Aliases: qat_analyse_lim_rule_dynamic_2d
### Keywords: ts

### ** Examples

vec <- array(rnorm(100),c(5,20))
min_vector<-array(rnorm(100)-2,c(5,20))
max_vector<-array(rnorm(100)+2,c(5,20))
result <- qat_analyse_lim_rule_dynamic_2d(vec, min_vector, max_vector, 
min_vector_name="minimum vector", max_vector_name="maximum vector")



