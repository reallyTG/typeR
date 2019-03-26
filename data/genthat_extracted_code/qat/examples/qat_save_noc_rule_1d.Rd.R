library(qat)


### Name: qat_save_noc_rule_1d
### Title: Produce a savelist from a resultlist for a NOC Rule Test
### Aliases: qat_save_noc_rule_1d
### Keywords: utilities

### ** Examples

	vec <- c(1,2,3,4,4,4,5,5,4,3,NaN,3,2,1)
	result <- list(result=qat_analyse_noc_rule_1d(vec, 1))
	savelist <- qat_save_noc_rule_1d(result)



