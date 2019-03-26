library(qat)


### Name: qat_analyse_lim_rule_dynamic_1d
### Title: Perform a dynamic lim-rule-check
### Aliases: qat_analyse_lim_rule_dynamic_1d qat_analyse_lim_rule_dynamic
### Keywords: ts

### ** Examples

vec <- rnorm(1000)
min_vector<-seq(-1,-2,length.out=1000)
max_vector<-seq(1,2,length.out=1000)
result <- qat_analyse_lim_rule_dynamic_1d(vec, min_vector, max_vector, 
min_vector_name="minimum vector", max_vector_name="maximum vector")



