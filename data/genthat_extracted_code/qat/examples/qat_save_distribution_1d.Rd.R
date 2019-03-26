library(qat)


### Name: qat_save_distribution_1d
### Title: Produce a savelist from a resultlist for a Distribution Test
### Aliases: qat_save_distribution_1d
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	result <- list(result=qat_analyse_distribution_1d(vec, 15))
	savelist <- qat_save_distribution_1d(result)	



