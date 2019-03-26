library(drake)


### Name: predict_runtime
### Title: Predict the elapsed runtime of the next call to 'make()' for
###   non-staged parallel backends.
### Aliases: predict_runtime

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D config <- make(my_plan) # Run the project, build the targets.
##D known_times <- c(5, rep(7200, nrow(my_plan) - 1))
##D names(known_times) <- c(file_store("report.md"), my_plan$target[-1])
##D known_times
##D # Predict the runtime
##D predict_runtime(
##D   config,
##D   jobs = 7,
##D   from_scratch = TRUE,
##D   known_times = known_times
##D )
##D predict_runtime(
##D   config,
##D   jobs = 8,
##D   from_scratch = TRUE,
##D   known_times = known_times
##D )
##D balance <- predict_load_balancing(
##D   config,
##D   jobs = 7,
##D   from_scratch = TRUE,
##D   known_times = known_times,
##D   targets_only = TRUE
##D )
##D balance
##D })
## End(Not run)



