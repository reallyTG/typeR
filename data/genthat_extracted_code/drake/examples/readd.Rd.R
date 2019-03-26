library(drake)


### Name: readd
### Title: Read and return a drake target/import from the cache.
### Aliases: readd loadd

### ** Examples

## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the project, build the targets.
##D readd(reg1) # Return imported object 'reg1' from the cache.
##D readd(small) # Return targets 'small' from the cache.
##D readd("large", character_only = TRUE) # Return 'large' from the cache.
##D # For external files, only the fingerprint/hash is stored.
##D readd(file_store("report.md"), character_only = TRUE)
##D })
## End(Not run)
## Not run: 
##D test_with_dir("Quarantine side effects.", {
##D load_mtcars_example() # Get the code with drake_example("mtcars").
##D make(my_plan) # Run the projects, build the targets.
##D loadd(small) # Load target 'small' into your workspace.
##D small
##D # For many targets, you can parallelize loadd()
##D # using the 'jobs' argument.
##D loadd(list = c("small", "large"), jobs = 2)
##D ls()
##D # Load the dependencies of the target, coef_regression2_small
##D loadd(coef_regression2_small, deps = TRUE)
##D ls()
##D # Load all the imported objects/functions.
##D # Note: loadd() excludes foreign imports
##D # (R objects not originally defined in `envir`
##D # when `make()` last imported them).
##D loadd(imported_only = TRUE)
##D ls()
##D # Load all the targets listed in the workflow plan
##D # of the previous `make()`.
##D # Be sure your computer has enough memory.
##D loadd()
##D ls()
##D # With files, you just get the fingerprint.
##D loadd(list = file_store("report.md"))
##D ls() # Should include "\"report.md\"".
##D get(file_store("report.md"))
##D })
## End(Not run)



