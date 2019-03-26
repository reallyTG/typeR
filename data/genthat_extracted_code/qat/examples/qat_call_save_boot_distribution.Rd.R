library(qat)


### Name: qat_call_save_boot_distribution
### Title: Produce a savelist-entry for a Boot Distribution Test
### Aliases: qat_call_save_boot_distribution
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	workflowlist_part <- list(bootruns=1000)
	resultlist <- qat_call_boot_distribution(vec, workflowlist_part, element=1)	
	savelist <- qat_call_save_boot_distribution(resultlist[[2]])


