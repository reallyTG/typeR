library(qat)


### Name: qat_call_save_lim_rule
### Title: Produce a savelist-entry for a LIM-RULE Test
### Aliases: qat_call_save_lim_rule
### Keywords: utilities

### ** Examples

	vec <- rnorm(1000)
	min_vector<-seq(-1,-2,length.out=1000)
	max_vector<-seq(1,2,length.out=1000)
	workflowlist_part <- list(minimum_value=-2, maximum_value=2,minimum_vector="vec1",
	maximum_vector="vec2",minimum_vector_name="minimum vector",
	maximum_vector_name="maximum vector", sigma_factor=2)
	resultlist <- qat_call_lim_rule(vec, workflowlist_part, element=1, vec1=min_vector, 
	vec2=max_vector)
	savelist <- list()
	savelistcounter <- 1
	for (ii in 2:4) {
		savelist <- qat_call_save_lim_rule(resultlist[[ii]], savelist=savelist, 
		savelistcounter=savelistcounter)
		if (length(which(names(savelist)=="element"))==0) {
			savelistcounter<-length(savelist)
		} else {
			savelistcounter<-1		
		}
	}



