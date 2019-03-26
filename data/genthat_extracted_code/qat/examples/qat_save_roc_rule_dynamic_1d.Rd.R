library(qat)


### Name: qat_save_roc_rule_dynamic_1d
### Title: Produce a savelist from a resultlist for a ROC Rule Dynamic Test
### Aliases: qat_save_roc_rule_dynamic_1d
### Keywords: utilities

### ** Examples

	vec <- rnorm(100)
	min_vector<-seq(1,2,length.out=1000)
	max_vector<-seq(1,2,length.out=1000)
	result <- list(result=qat_analyse_roc_rule_dynamic_1d(vec, min_vector, 
	max_vector, upward_vector_name="upward vector", 
	downward_vector_name="downward vector"))
	savelist <- qat_save_roc_rule_dynamic_1d(result) 



