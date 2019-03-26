library(drake)


### Name: mk
### Title: Build a target inside a 'Makefile' during 'make(..., parallelism
###   = "Makefile")'.
### Aliases: mk
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # This function is meant to be part of Makefile recipes for
##D # make(..., parallelism = "Makefile").
##D # These examples peer into the internals of drake,
##D # but are not really of practical use for most users.
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan) # Internal configuration list.
##D # Prepare to use a distributed computing parallel backend
##D # such as "Makefile" or "future_lapply".
##D # The following happens during make().
##D store_drake_config(config = config)
##D prepare_distributed(config = config)
##D # Write the dummy timestamp files usually written at the beginning
##D # of make(..., parallelism = "Makefile").
##D time_stamps(config = config)
##D # Use mk() to build a target. Usually called inside a Makefile recipe.
##D mk(target = "small", cache_path = default_cache_path())
##D })
## End(Not run)



