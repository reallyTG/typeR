library(rslurm)


### Name: cleanup_files
### Title: Deletes temporary files associated with a Slurm job
### Aliases: cleanup_files

### ** Examples

## Not run: 
##D sjob <- slurm_apply(func, pars)
##D print_job_status(sjob) # Prints console/error output once job is completed.
##D func_result <- get_slurm_out(sjob, "table") # Loads output data into R.
##D cleanup_files(sjob)
## End(Not run)



