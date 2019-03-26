library(qat)


### Name: qat_call_save_roc_rule
### Title: Produce a savelist-entry for a ROC-Rule Test
### Aliases: qat_call_save_roc_rule
### Keywords: utilities

### ** Examples

	vec <- rnorm(100)
	downward_vector<-seq(1,2,length.out=1000)
	upward_vector<-seq(1,2,length.out=1000)
	workflowlist_part <- list(downward_value=2, upward_value=2,downward_vector="vec1",
	upward_vector="vec2",downward_vector_name="downward vector", 
	upward_vector_name="upward vector")
	resultlist <- qat_call_roc_rule(vec, workflowlist_part, element=1, 
	vec1=downward_vector, vec2=upward_vector)
	savelist <- list()
	savelistcounter <- 1
	for (ii in 2:3) {
		savelist <- qat_call_save_roc_rule(resultlist[[ii]], savelist=savelist, 
		savelistcounter=savelistcounter)
		if (length(which(names(savelist)=="element"))==0) {
			savelistcounter<-length(savelist)
		} else {
			savelistcounter<-1		
		}
	}



