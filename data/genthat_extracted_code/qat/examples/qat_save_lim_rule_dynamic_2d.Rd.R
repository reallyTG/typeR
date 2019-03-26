library(qat)


### Name: qat_save_lim_rule_dynamic_2d
### Title: Produce a savelist from a resultlist for a LIM Rule Dynamic Test
### Aliases: qat_save_lim_rule_dynamic_2d
### Keywords: utilities

### ** Examples

	vec <- array(rnorm(1000), c(10, 100))
	min_vector<-array(seq(-1,-2,length.out=1000), c(10, 100))
	max_vector<-array(seq(1,2,length.out=1000), c(10, 100))
	result <- list(result=qat_analyse_lim_rule_dynamic_2d(vec, min_vector, 
	max_vector, min_vector_name="minimum vector", max_vector_name="maximum vector"))
	savelist <- qat_save_lim_rule_dynamic_2d(result)



