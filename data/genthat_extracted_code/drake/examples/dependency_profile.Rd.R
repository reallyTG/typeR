library(drake)


### Name: dependency_profile
### Title: Find out why a target is out of date.
### Aliases: dependency_profile

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Load drake's canonical example.
##D config <- make(my_plan) # Run the project, build the targets.
##D # Get some example dependency profiles of targets.
##D dependency_profile(small, config = config)
##D # Change a dependency.
##D simulate <- function(x) {}
##D # Update the in-memory imports in the cache
##D # so dependency_profile can detect changes to them.
##D # Changes to targets are already cached.
##D make(my_plan, skip_targets = TRUE)
##D # The dependency hash changed.
##D dependency_profile(small, config = config)
##D })
## End(Not run)



