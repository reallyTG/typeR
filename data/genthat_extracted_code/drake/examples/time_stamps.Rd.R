library(drake)


### Name: time_stamps
### Title: Write dummy timestamp files for 'make(..., parallelism =
###   "Makefile")'.
### Aliases: time_stamps
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan) # Master internal configuration list
##D time_stamps(config)
##D # Now look in '.drake/ts' for dummy timestamp files.
##D })
## End(Not run)



