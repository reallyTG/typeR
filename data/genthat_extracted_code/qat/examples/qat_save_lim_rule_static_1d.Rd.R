library(qat)


### Name: qat_save_lim_rule_static_1d
### Title: Produce a savelist from a resultlist for a LIM Rule Static Test
### Aliases: qat_save_lim_rule_static_1d
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	result <- list(result=qat_analyse_lim_rule_static_1d(vec, -2,2))
	savelist <- qat_save_lim_rule_static_1d(result)



