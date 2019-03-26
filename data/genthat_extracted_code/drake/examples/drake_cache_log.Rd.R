library(drake)


### Name: drake_cache_log
### Title: Get a table that represents the state of the cache.
### Aliases: drake_cache_log

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # Load drake's canonical example.
##D load_mtcars_example() # Get the code with drake_example()
##D # Run the project, build all the targets.
##D make(my_plan)
##D # Get a data frame of all the hash keys.
##D # If you want a changelog, be sure to do this after every make().
##D cache_log <- drake_cache_log()
##D head(cache_log)
##D # Save the hash log as a flat text file.
##D write.table(
##D   x = cache_log,
##D   file = "drake_cache.log",
##D   quote = FALSE,
##D   row.names = FALSE
##D )
##D # At this point, put drake_cache.log under version control
##D # (e.g. with 'git add drake_cache.log') alongside your code.
##D # Now, every time you run your project, your commit history
##D # of hash_lot.txt is a changelog of the project's results.
##D # It shows which targets and imports changed on every commit.
##D # It is extremely difficult to track your results this way
##D # by putting the raw '.drake/' cache itself under version control.
##D })
## End(Not run)



