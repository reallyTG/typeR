library(drake)


### Name: make
### Title: Run your project (build the outdated targets).
### Aliases: make

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- drake_config(my_plan)
##D outdated(config) # Which targets need to be (re)built?
##D make(my_plan, jobs = 2) # Build what needs to be built.
##D outdated(config) # Everything is up to date.
##D # Change one of your imported function dependencies.
##D reg2 = function(d) {
##D   d$x3 = d$x^3
##D   lm(y ~ x3, data = d)
##D }
##D outdated(config) # Some targets depend on reg2().
##D make(my_plan) # Rebuild just the outdated targets.
##D outdated(config) # Everything is up to date again.
##D vis_drake_graph(config) # See how they fit in an interactive graph.
##D make(my_plan, cache_log_file = TRUE) # Write a text log file this time.
##D vis_drake_graph(config) # The colors changed in the graph.
##D clean() # Start from scratch.
##D # Run with at most 2 jobs at a time for the imports
##D # and at most 4 jobs at a time for the targets.
##D make(my_plan, jobs = c(imports = 2, targets = 4))
##D clean() # Start from scratch.
##D # Rerun with "Makefile" parallelism with at most 4 jobs.
##D # Requires Rtools on Windows.
##D # make(my_plan, parallelism = "Makefile", jobs = 4) # nolint
##D clean() # Start from scratch.
##D # Specify your own Makefile recipe.
##D # Requires Rtools on Windows.
##D # make(my_plan, parallelism = "Makefile", jobs = 4, # nolint
##D #   recipe_command = "R -q -e") # nolint
##D #
##D # make() respects tidy evaluation as implemented in the rlang package.
##D # This workflow plan uses rlang's quasiquotation operator `!!`.
##D my_plan <- drake_plan(list = c(
##D   little_b = "\"b\"",
##D   letter = "!!little_b"
##D ))
##D my_plan
##D make(my_plan)
##D readd(letter) # "b"
##D })
## End(Not run)



