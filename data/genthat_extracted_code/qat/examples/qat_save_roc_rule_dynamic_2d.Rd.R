library(qat)


### Name: qat_save_roc_rule_dynamic_2d
### Title: Produce a savelist from a resultlist for a ROC Rule Dynamic Test
### Aliases: qat_save_roc_rule_dynamic_2d
### Keywords: utilities

### ** Examples

	vec <- array(rnorm(1000), c(10, 100))
	min_vector<-array(seq(-1,-2,length.out=1000), c(10, 100))
	max_vector<-array(seq(1,2,length.out=1000), c(10, 100))
	result <- list(result=qat_analyse_roc_rule_dynamic_2d(vec, min_vector, 
	max_vector, upward_vector_name="upward vector", downward_vector_name="downward vector"))
	savelist <- qat_save_roc_rule_dynamic_2d(result) 



