library(qat)


### Name: qat_save_block_distribution_1d
### Title: Produce a savelist from a resultlist for a Block Distribution
###   Test
### Aliases: qat_save_block_distribution_1d
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	result <- list(result=qat_analyse_block_distribution_1d(vec, 50))
	savelist <- qat_save_block_distribution_1d(result)	



