library(qat)


### Name: qat_call_save_noc_rule
### Title: Produce a savelist-entry for a NOC RULE Test
### Aliases: qat_call_save_noc_rule
### Keywords: utilities

### ** Examples

	vec <- c(1,2,3,4,4,4,5,5,4,3,NaN,3,2,1)
	workflowlist_part <- list(max_return_elements=1)
	resultlist <- qat_call_noc_rule(vec, workflowlist_part,element=1)
	savelist <- qat_call_save_noc_rule(resultlist[[2]])



