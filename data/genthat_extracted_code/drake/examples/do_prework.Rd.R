library(drake)


### Name: do_prework
### Title: Do the prework in the 'prework' argument to 'make()'.
### Aliases: do_prework
### Keywords: internal

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D # Create a master internal configuration list with prework.
##D con <- drake_config(my_plan, prework = c("library(knitr)", "x <- 1"))
##D # Do the prework. Usually done at the beginning of `make()`,
##D # and for distributed computing backends like "future_lapply",
##D # right before each target is built.
##D do_prework(config = con, verbose_packages = TRUE)
##D identical(x, 1) # Should be TRUE.
##D })
## End(Not run)



