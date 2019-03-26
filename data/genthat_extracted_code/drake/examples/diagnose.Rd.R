library(drake)


### Name: diagnose
### Title: Get diagnostic metadata on a target.
### Aliases: diagnose

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D diagnose() # List all the targets with recorded error logs.
##D # Define a function doomed to failure.
##D f <- function() {
##D   stop("unusual error")
##D }
##D # Create a workflow plan doomed to failure.
##D bad_plan <- drake_plan(my_target = f())
##D # Running the project should generate an error
##D # when trying to build 'my_target'.
##D try(make(bad_plan), silent = FALSE)
##D failed() # List the failed targets from the last make() (my_target).
##D # List targets that failed at one point or another
##D # over the course of the project (my_target).
##D # drake keeps all the error logs.
##D diagnose()
##D # Get the error log, an object of class "error".
##D error <- diagnose(my_target)$error # See also warnings and messages.
##D str(error) # See what's inside the error log.
##D error$calls # View the traceback. (See the traceback() function).
##D suppressWarnings(
##D   make(
##D     drake_plan(
##D       x = 1,
##D       y = warning(123),
##D       z = warning(456)
##D     ),
##D     verbose = FALSE
##D   )
##D )
##D targets <- built(verbose = FALSE)
##D out <- lapply(targets, diagnose, character_only = TRUE, verbose = FALSE)
##D names(out) <- targets
##D unlist(out)
##D })
## End(Not run)



