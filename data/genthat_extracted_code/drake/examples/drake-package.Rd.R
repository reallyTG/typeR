library(drake)


### Name: drake-package
### Title: drake: A pipeline toolkit for reproducible computation at scale.
### Aliases: drake-package drake

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D library(drake)
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Build everything.
##D make(my_plan) # Nothing is done because everything is already up to date.
##D reg2 = function(d) { # Change one of your functions.
##D   d$x3 = d$x^3
##D   lm(y ~ x3, data = d)
##D }
##D make(my_plan) # Only the pieces depending on reg2() get rebuilt.
##D # Write a flat text log file this time.
##D make(my_plan, cache_log_file = TRUE)
##D # Read/load from the cache.
##D readd(small)
##D loadd(large)
##D head(large)
##D clean() # Restart from scratch.
##D make(my_plan, jobs = 2) # Distribute over 2 parallel jobs.
##D clean() # Restart from scratch.
##D # Parallelize over at most 4 separate R sessions.
##D # Requires Rtools on Windows.
##D # make(my_plan, jobs = 4, parallelism = "Makefile") # nolint
##D # Everything is already up to date.
##D # make(my_plan, jobs = 4, parallelism = "Makefile") # nolint
##D clean(destroy = TRUE) # Totally remove the cache.
##D unlink("report.Rmd") # Clean up the remaining files.
##D })
## End(Not run)



