library(qat)


### Name: qat_add_comment
### Title: Comment on result
### Aliases: qat_add_comment
### Keywords: manip

### ** Examples

library("qat")
# read in workflow from systemfiles
filename_in <- system.file("extdata/workflowexample.xml", package="qat")
workflowlist <- qat_config_read_workflow(filename_in)
# add some more informations for the workflow
workflowlist <- qat_add_comment(workflowlist, 1, "No problems")
filename_out <- "myworkflow_result.xml" 
# write edited workflow in current directory
qat_config_write_workflow(workflowlist, output_filename=filename_out) 



