library(drake)


### Name: in_progress
### Title: List the targets that either (1) are currently being built
###   during a 'make()', or (2) were being built if the last 'make()' quit
###   unexpectedly.
### Aliases: in_progress

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Kill before targets finish.
##D # If you interrupted make(), some targets will probably be listed:
##D in_progress()
##D })
## End(Not run)



