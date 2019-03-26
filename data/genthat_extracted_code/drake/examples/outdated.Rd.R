library(drake)


### Name: outdated
### Title: List the targets that are out of date.
### Aliases: outdated

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Recopute the config list early and often to have the
##D # most current information. Do not modify the config list by hand.
##D config <- drake_config(my_plan)
##D outdated(config = config) # Which targets are out of date?
##D config <- make(my_plan) # Run the projects, build the targets.
##D # Now, everything should be up to date (no targets listed).
##D outdated(config = config)
##D # outdated() is sensitive to triggers.
##D # See the debugging guide: https://ropenscilabs.github.io/drake-manual/debug.html # nolint
##D config$trigger <- "always"
##D outdated(config = config)
##D })
## End(Not run)



