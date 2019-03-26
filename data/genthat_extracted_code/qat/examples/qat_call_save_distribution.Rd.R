library(qat)


### Name: qat_call_save_distribution
### Title: Produce a savelist-entry for a Distribution Test
### Aliases: qat_call_save_distribution
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	workflowlist_part <- list(numofbars=15)
	resultlist <- qat_call_distribution(vec, workflowlist_part, element=1)	
	qat_call_plot_distribution(resultlist[[2]], measurement_vector=vec, 
	measurement_name="Result of Check", basename="exampleplot")
	savelist <- qat_call_save_distribution(resultlist[[2]])


