library(drake)


### Name: built
### Title: List all the built targets (non-imports) in the cache.
### Aliases: built

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Load drake's canonical example.
##D make(my_plan) # Run the project, build all the targets.
##D built() # List all the cached targets (built objects and files).
##D # For file targets, only the fingerprints/hashes are stored.
##D })
## End(Not run)



