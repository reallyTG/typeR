library(drake)


### Name: drake_hpc_template_files
### Title: List the available example template files for deploying work to
###   a cluster / job scheduler.
### Aliases: drake_hpc_template_files

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # List the available template files.
##D drake_hpc_template_files()
##D # Write a SLURM template file from the SLURM example.
##D drake_hpc_template_file("slurm_batchtools.tmpl") # Writes slurm_batchtools.tmpl.
##D # library(future.batchtools) # nolint
##D # future::plan(batchtools_slurm, template = "slurm_batchtools.tmpl") # nolint
##D # make(my_plan, parallelism = "future", jobs = 2) # nolint
##D })
## End(Not run)



