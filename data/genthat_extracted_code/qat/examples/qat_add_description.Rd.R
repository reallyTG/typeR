library(qat)


### Name: qat_add_description
### Title: Description of a check
### Aliases: qat_add_description
### Keywords: manip

### ** Examples

library("qat")
# read in workflow from systemfiles
filename_in <- system.file("extdata/workflowexample.xml", package="qat")
workflowlist <- qat_config_read_workflow(filename_in)
# add some more informations for the workflow
workflowlist <- qat_add_description(workflowlist, 1, "How the test works...")
filename_out <- "myworkflow_result.xml" 
# write edited workflow in current directory
qat_config_write_workflow(workflowlist, output_filename=filename_out) 


