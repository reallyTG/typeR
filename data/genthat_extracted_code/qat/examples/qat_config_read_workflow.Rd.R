library(qat)


### Name: qat_config_read_workflow
### Title: Read an XML workflow
### Aliases: qat_config_read_workflow
### Keywords: IO

### ** Examples

library("qat")
# read in workflow from systemfiles
filename_in <- system.file("extdata/workflowexample.xml", package="qat")
workflowlist <- qat_config_read_workflow(filename_in)



