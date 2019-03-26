library(qat)


### Name: qat_save_result_ncdf
### Title: Writing a savelist to a netCDF-file
### Aliases: qat_save_result_ncdf
### Keywords: utilities

### ** Examples

	library("qat")
	# define testvector
	testvector<-rnorm(500)
	# read in workflow from systemfiles
	filename_in <- system.file("extdata/workflowexample.xml", package="qat")
	workflowlist <- qat_config_read_workflow(filename_in)
	# define some additional vectors
	maxlim <- seq(3,1,length.out=500)
	minlim <- seq(-1,-3,length.out=500)
	uproc <- seq(1,3,length.out=500)
	downroc <- seq(3,1,length.out=500)
	# run the workflow on the testvector
	rlist <- qat_run_workflow_check(testvector,workflowlist,vec1=maxlim, vec2=minlim, 
	vec3=uproc, vec4=downroc)
	# produce the savelist
	savelist <- qat_run_workflow_save(rlist)
	filename_out <- "myresults" 
	# write netCDF-file of the results in current directory
## Not run: 
##D qat_save_result_ncdf(testvector, savelist=savelist, filename_out, 
##D workflowlist=workflowlist,vec1=maxlim, vec2=minlim, vec3=uproc, vec4=downroc)
## End(Not run)


