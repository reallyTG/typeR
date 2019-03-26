library(qat)


### Name: qat_save_trimmed_distribution_1d
### Title: Produce a savelist from a resultlist for a Trimmed Distribution
###   Test
### Aliases: qat_save_trimmed_distribution_1d
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	result <- list(result=qat_analyse_trimmed_distribution_1d(vec))
	savelist <- qat_save_trimmed_distribution_1d(result)	



