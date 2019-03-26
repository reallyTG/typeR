library(qat)


### Name: qat_call_save_slide_distribution
### Title: Produce a savelist-entry for a Slide Distribution Test
### Aliases: qat_call_save_slide_distribution
### Keywords: utilities

### ** Examples

	vec <- rnorm(100)
	workflowlist_part <- list(blocksize=10)
	resultlist <- qat_call_slide_distribution(vec, workflowlist_part, element=1)	
	savelist <- qat_call_save_slide_distribution(resultlist[[2]])



