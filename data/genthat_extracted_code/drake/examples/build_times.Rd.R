library(drake)


### Name: build_times
### Title: List the time it took to build each target/import.
### Aliases: build_times

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D # Show the build times for the mtcars example.
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Build all the targets.
##D build_times() # Show how long it took to build each target.
##D })
## End(Not run)



