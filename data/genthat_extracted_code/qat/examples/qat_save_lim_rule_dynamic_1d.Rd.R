library(qat)


### Name: qat_save_lim_rule_dynamic_1d
### Title: Produce a savelist from a resultlist for a LIM Rule Dynamic Test
### Aliases: qat_save_lim_rule_dynamic_1d
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	min_vector<-seq(-1,-2,length.out=1000)
	max_vector<-seq(1,2,length.out=1000)
	result <- list(result=qat_analyse_lim_rule_dynamic_1d(vec, min_vector, 
	max_vector, min_vector_name="minimum vector", max_vector_name="maximum vector"))
	savelist <- qat_save_lim_rule_dynamic_1d(result)



