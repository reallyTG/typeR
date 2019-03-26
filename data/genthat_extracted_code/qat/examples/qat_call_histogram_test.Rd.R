library(qat)


### Name: qat_call_histogram_test
### Title: Perform a LIM Rule Check
### Aliases: qat_call_histogram_test
### Keywords: utilities

### ** Examples

vec <- c(rnorm(1000), rnorm(1000)+1)
workflowlist_part <- list(blocksize=50, numofbars=65, metric="emd")
resultlist <- qat_call_histogram_test(vec, workflowlist_part, element=1)	
savelist <- qat_call_save_histogram_test(resultlist[[2]])



