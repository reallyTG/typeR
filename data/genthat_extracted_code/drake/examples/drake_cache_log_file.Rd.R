library(drake)


### Name: drake_cache_log_file
### Title: Generate a flat text log file to represent the state of the
###   cache.
### Aliases: drake_cache_log_file

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # Load drake's canonical example.
##D load_mtcars_example() # Get the code with drake_example()
##D # Run the project and save a flat text log file.
##D make(my_plan)
##D drake_cache_log_file() # writes drake_cache.log
##D # The above 2 lines are equivalent to make(my_plan, cache_log_file = TRUE) # nolint
##D # At this point, put drake_cache.log under version control
##D # (e.g. with 'git add drake_cache.log') alongside your code.
##D # Now, every time you run your project, your commit history
##D # of hash_lot.txt is a changelog of the project's results.
##D # It shows which targets and imports changed on every commit.
##D # It is extremely difficult to track your results this way
##D # by putting the raw '.drake/' cache itself under version control.
##D })
## End(Not run)



