library(qat)


### Name: qat_call_save_block_distribution
### Title: Produce a savelist-entry for a Block Distribution Test
### Aliases: qat_call_save_block_distribution
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	workflowlist_part <- list(blocksize=50)
	resultlist <- qat_call_block_distribution(vec, workflowlist_part, element=1)	
	savelist <- qat_call_save_block_distribution(resultlist[[2]])


