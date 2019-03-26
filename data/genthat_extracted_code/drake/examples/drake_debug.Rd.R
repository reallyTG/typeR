library(drake)


### Name: drake_debug
### Title: Run a single target's command in debug mode.
### Aliases: drake_debug

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # This example is not really a user-side demonstration.
##D # It just walks through a dive into the internals.
##D # Populate your workspace and write 'report.Rmd'.
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Create the master internal configuration list.
##D config <- drake_config(my_plan)
##D out <- drake_build(small, config = config)
##D # Now includes `small`.
##D cached()
##D head(readd(small))
##D # `small` was invisibly returned.
##D head(out)
##D # If you previously called make(),
##D # `config` is just read from the cache.
##D make(my_plan, verbose = FALSE)
##D result <- drake_build(small)
##D head(result)
##D })
## End(Not run)



