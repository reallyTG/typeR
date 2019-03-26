library(qat)


### Name: qat_save_block_distribution_2d
### Title: Produce a savelist from a resultlist for a Block Distribution
###   Test
### Aliases: qat_save_block_distribution_2d
### Keywords: utilities

### ** Examples

	vec <- array(rnorm(1000), c(10, 100))
	result <- list(result=qat_analyse_block_distribution_2d(vec, 5))
	savelist <- qat_save_block_distribution_2d(result)	



