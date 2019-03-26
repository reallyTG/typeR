library(qat)


### Name: qat_save_noc_rule_2d
### Title: Produce a savelist from a resultlist for a NOC Rule Test
### Aliases: qat_save_noc_rule_2d
### Keywords: utilities

### ** Examples

	vec <- array(c(1,2,3,4,4,4,5,5,4,3,NaN,3,2,11), c(5,3))
	result <- list(result=qat_analyse_noc_rule_2d(vec, 1))
	savelist <- qat_save_noc_rule_2d(result)



