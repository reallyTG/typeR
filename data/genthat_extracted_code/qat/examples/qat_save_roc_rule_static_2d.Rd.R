library(qat)


### Name: qat_save_roc_rule_static_2d
### Title: Produce a savelist from a resultlist for a ROC Rule Static Test
### Aliases: qat_save_roc_rule_static_2d
### Keywords: utilities

### ** Examples

	vec <- array(rnorm(1000), c(10, 100))
	result <- list(result=qat_analyse_roc_rule_static_2d(vec, 2,2))
	savelist <- qat_save_roc_rule_static_2d(result) 



