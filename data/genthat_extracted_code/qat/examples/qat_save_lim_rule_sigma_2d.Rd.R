library(qat)


### Name: qat_save_lim_rule_sigma_2d
### Title: Produce a savelist from a resultlist for a LIM Rule Sigma Test
### Aliases: qat_save_lim_rule_sigma_2d
### Keywords: utilities

### ** Examples

	vec <- array(rnorm(1000), c(10, 100))
	result <- list(result=qat_analyse_lim_rule_sigma_2d(vec, 2))
	savelist <- qat_save_lim_rule_sigma_2d(result)



